"""
Para sustentar essa interação, definimos o cliente do Glue, databases e utilitários de mapeamento de tipos:
"""

import logging
import os

import boto3
import pandas as pd
from pandas.api.types import (
    is_bool_dtype,
    is_datetime64_any_dtype,
    is_float_dtype,
    is_integer_dtype,
)

logger = logging.getLogger()

GLUE_DATABASE = os.environ.get("GLUE_DATABASE", "silver")
BRONZE_GLUE_DATABASE = os.environ.get("BRONZE_GLUE_DATABASE", "bronze")
S3_BUCKET = os.environ["S3_BUCKET"]

glue_client = boto3.client("glue")


"""
Consultamos o schema na Bronze para apoiar os casts na Silver:
"""


def get_bronze_table_schema(table_name: str) -> dict[str, str]:
    try:
        resp = glue_client.get_table(
            DatabaseName=BRONZE_GLUE_DATABASE,
            Name=table_name,
        )
        table = resp["Table"]
        schema = {}
        for col in table["StorageDescriptor"].get("Columns", []):
            schema[col["Name"]] = col["Type"]
        return schema
    except glue_client.exceptions.EntityNotFoundException:
        logger.warning(
            f"[Glue] Tabela Bronze '{table_name}' não encontrada na database '{BRONZE_GLUE_DATABASE}' - Erro ao ler schema da Bronze"
        )
        return {}
    except Exception as exc:
        logger.error(f"[Glue] Erro ao ler schema da Bronze '{table_name}': {exc}")
        return {}


"""Fazemos o mapeamento de dtypes do pandas para tipos do Glue:"""


def _pandas_dtype_to_glue(dtype) -> str:
    if is_bool_dtype(dtype):
        return "boolean"
    if is_integer_dtype(dtype):
        return "bigint"
    if is_float_dtype(dtype):
        return "double"
    if is_datetime64_any_dtype(dtype):
        return "timestamp"
    return "string"


"""Garantimos a existência/atualização da tabela da Silver no Glue:"""


def ensure_glue_table(output_name: str, df: pd.DataFrame, partitioned: bool) -> None:
    """Cria ou atualiza a tabela no Glue Catalog.

    Quando partitioned=True, as colunas 'year' e 'month' são registradas em
    PartitionKeys (e NÃO em StorageDescriptor.Columns), conforme exigido pelo
    Glue/Athena para tabelas particionadas por Hive-style.
    """
    try:
        location = f"s3://{S3_BUCKET}/silver/{output_name}/"

        # Colunas de partição não devem aparecer em StorageDescriptor.Columns
        partition_col_names = ["year", "month"] if partitioned else []
        ignored_cols = set(partition_col_names)
        data_columns = [c for c in df.columns if c not in ignored_cols]
        col_defs = [
            {"Name": col, "Type": _pandas_dtype_to_glue(df[col].dtype)}
            for col in data_columns
        ]

        # PartitionKeys: year (bigint) e month (bigint) para tabelas particionadas
        partition_keys = (
            [
                {"Name": "year", "Type": "bigint"},
                {"Name": "month", "Type": "bigint"},
            ]
            if partitioned
            else []
        )

        storage_descriptor = {
            "Location": location,
            "InputFormat": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat",
            "OutputFormat": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat",
            "SerdeInfo": {
                "SerializationLibrary": "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe",
                "Parameters": {"serialization.format": "1"},
            },
            "Columns": col_defs,
        }

        table_input = {
            "Name": output_name,
            "StorageDescriptor": storage_descriptor,
            "PartitionKeys": partition_keys,
            "TableType": "EXTERNAL_TABLE",
            "Parameters": {"classification": "parquet"},
        }

        try:
            glue_client.get_table(DatabaseName=GLUE_DATABASE, Name=output_name)
            glue_client.update_table(DatabaseName=GLUE_DATABASE, TableInput=table_input)
            logger.info(f"[Glue] Tabela '{output_name}' atualizada")
        except glue_client.exceptions.EntityNotFoundException:
            glue_client.create_table(DatabaseName=GLUE_DATABASE, TableInput=table_input)
            logger.info(f"[Glue] Tabela '{output_name}' criada")

    except Exception as exc:
        logger.error(f"[Glue] Erro ao registrar tabela '{output_name}': {exc}")


"""E registramos as partições no Glue quando houver particionamento:"""


def register_glue_partitions(
    output_name: str, partitions: set[tuple[int, int]]
) -> None:
    try:
        if not partitions:
            return

        location_base = f"s3://{S3_BUCKET}/silver/{output_name}"
        partition_inputs = []
        for year, month in partitions:
            partition_inputs.append(
                {
                    "Values": [str(year), str(month)],
                    "StorageDescriptor": {
                        "Location": f"{location_base}/year={year}/month={month:02d}/",
                        "InputFormat": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat",
                        "OutputFormat": "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat",
                        "SerdeInfo": {
                            "SerializationLibrary": "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe",
                        },
                    },
                }
            )

        for i in range(0, len(partition_inputs), 100):
            batch = partition_inputs[i : i + 100]
            try:
                glue_client.batch_create_partition(
                    DatabaseName=GLUE_DATABASE,
                    TableName=output_name,
                    PartitionInputList=batch,
                )
            except Exception as exc:
                # AlreadyExists é esperado em reprocessamentos incrementais.
                logger.info(f"[Glue] Partições do lote processadas para '{output_name}': {exc}")

    except Exception as exc:
        logger.error(f"[Glue] Erro ao registrar partições para '{output_name}': {exc}")
