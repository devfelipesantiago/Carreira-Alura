import json
import os
import csv
import io
import logging
from datetime import datetime

import psycopg2
import boto3
from botocore.config import Config

logger = logging.getLogger()
logger.setLevel(logging.INFO)

SECRET_NAME = os.environ["SECRET_NAME"]
S3_BUCKET = os.environ["S3_BUCKET"]

aws_client_config = Config(
    connect_timeout=5,
    read_timeout=10,
    retries={"total_max_attempts": 2, "mode": "standard"},
)

s3_client = boto3.client("s3", config=aws_client_config)
secrets_client = boto3.client("secretsmanager", config=aws_client_config)

_db_secret = None


def get_db_secret():
    """Busca as credenciais do banco no Secrets Manager (com cache em memória)."""
    global _db_secret
    if _db_secret is None:
        response = secrets_client.get_secret_value(SecretId=SECRET_NAME)
        _db_secret = json.loads(response["SecretString"])
    return _db_secret


# Tabelas a serem extraídas
TABLES = [
    "erp_hp_clie",
    "erp_it_prod",
    "erp_ov_cabe",
    "erp_ov_item",
    "erp_fn_pgto"
    ]


def get_connection():
    """Cria conexão com o RDS PostgreSQL usando credenciais do Secrets Manager."""
    secret = get_db_secret()

    return psycopg2.connect(
        host=secret["host"],
        port=secret["port"],
        dbname=secret["database"],
        user=secret["username"],
        password=secret["password"],
        connect_timeout=10,
    )


def extract_table(cursor, table_name):
    """Executa SELECT * na tabela e retorna os dados com headers."""
    cursor.execute(f"SELECT * FROM {table_name}")
    columns = [desc[0] for desc in cursor.description]
    rows = cursor.fetchall()
    return columns, rows


def write_csv_to_s3(columns, rows, table_name, timestamp):
    """Escreve os dados em CSV no S3 na camada Bronze."""
    output = io.StringIO()
    writer = csv.writer(output)
    writer.writerow(columns)
    writer.writerows(rows)
    s3_key = f"bronze/{table_name}/{table_name}_{timestamp}.csv"

    s3_client.put_object(
        Bucket=S3_BUCKET, Key=s3_key, Body=output.getvalue(), ContentType="text/csv"
    )
    return s3_key


def handler(event, context):
    """Handler principal da Lambda."""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    logger.info(f"Iniciando extração Bronze - {timestamp}")

    conn = None
    results = {}

    try:
        conn = get_connection()
        cursor = conn.cursor()

        for table_name in TABLES:
            logger.info(f"Extraindo tabela: {table_name}")

            columns, rows = extract_table(cursor, table_name)
            s3_key = write_csv_to_s3(columns, rows, table_name, timestamp)

            results[table_name] = {"rows_extracted": len(rows), "s3_key": s3_key}

            logger.info(f"{len(rows)} registros salvos em s3://{S3_BUCKET}/{s3_key}")

        cursor.close()

        return {
            "statusCode": 200,
            "body": {
                "message": "Extração Bronze concluída com sucesso",
                "timestamp": timestamp,
                "tables": results,
                "s3_bucket": S3_BUCKET,
            },
        }

    except Exception as e:
        logger.error(f"Erro na extração: {str(e)}")
        raise e

    finally:
        if conn:
            conn.close()
