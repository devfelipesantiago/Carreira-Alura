"""
Catalog Module - Camada Gold
Funções para registrar e atualizar databases, tabelas e partições no AWS Glue Data Catalog.
"""

import logging
import os

import boto3
import pyarrow as pa

logger = logging.getLogger(__name__)

GLUE_DATABASE = os.environ.get("GLUE_DATABASE", "gold")
S3_BUCKET = os.environ.get("S3_BUCKET", "")
glue_client = boto3.client("glue")


# ---------------------------------------------------------------------------
# Mapeamento de Tipos PyArrow -> AWS Glue
# ---------------------------------------------------------------------------


def _pyarrow_type_to_glue(pa_type: pa.DataType) -> str:
    """Mapeia um tipo do PyArrow para o tipo compatível com o Glue/Hive/Athena."""
    if pa.types.is_boolean(pa_type):
        return "boolean"
    if pa.types.is_int64(pa_type):
        return "bigint"
    if pa.types.is_integer(pa_type):
        return "int"
    if pa.types.is_floating(pa_type):
        return "double"
    if pa.types.is_timestamp(pa_type):
        return "timestamp"
    if pa.types.is_date(pa_type):
        return "date"
    return "string"


# ---------------------------------------------------------------------------
# Operações de Catálogo
# ---------------------------------------------------------------------------


def ensure_glue_database(database_name: str = GLUE_DATABASE) -> None:
    """Garante que a base de dados do Glue exista, criando-a se necessário."""
    try:
        glue_client.get_database(Name=database_name)
        logger.info(f"[Glue] Database '{database_name}' já existe.")
    except glue_client.exceptions.EntityNotFoundException:
        try:
            glue_client.create_database(
                DatabaseInput={
                    "Name": database_name,
                    "Description": "Camada Gold analítica do Data Lake Alumart",
                }
            )
            logger.info(f"[Glue] Database '{database_name}' criada com sucesso.")
        except Exception as exc:
            logger.error(f"[Glue] Erro ao criar database '{database_name}': {exc}")
    except Exception as exc:
        logger.error(f"[Glue] Erro ao verificar database '{database_name}': {exc}")


def ensure_glue_table(
    table_name: str,
    schema: pa.Schema,
    partition_col: str | None = None,
    database_name: str = GLUE_DATABASE,
) -> None:
    """Cria ou atualiza a definição da tabela no AWS Glue Catalog.

    Se a tabela for particionada, a coluna de partição é registrada em
    PartitionKeys e omitida de StorageDescriptor.Columns.
    """
    try:
        ensure_glue_database(database_name)

        location = f"s3://{S3_BUCKET}/gold/{table_name}/"

        # Colunas normais (excluindo a coluna de partição)
        col_defs = []
        for field in schema:
            if partition_col and field.name == partition_col:
                continue
            col_defs.append(
                {
                    "Name": field.name,
                    "Type": _pyarrow_type_to_glue(field.type),
                }
            )

        # Chaves de partição
        partition_keys = []
        if partition_col:
            partition_keys = [{"Name": partition_col, "Type": "string"}]

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
            "Name": table_name,
            "StorageDescriptor": storage_descriptor,
            "PartitionKeys": partition_keys,
            "TableType": "EXTERNAL_TABLE",
            "Parameters": {"classification": "parquet"},
        }

        try:
            glue_client.get_table(DatabaseName=database_name, Name=table_name)
            glue_client.update_table(DatabaseName=database_name, TableInput=table_input)
            logger.info(
                f"[Glue] Tabela '{database_name}.{table_name}' atualizada com sucesso."
            )
        except glue_client.exceptions.EntityNotFoundException:
            glue_client.create_table(DatabaseName=database_name, TableInput=table_input)
            logger.info(
                f"[Glue] Tabela '{database_name}.{table_name}' criada com sucesso."
            )

    except Exception as exc:
        logger.error(
            f"[Glue] Erro ao registrar tabela '{database_name}.{table_name}': {exc}"
        )


def register_glue_partitions(
    table_name: str,
    partition_col: str,
    partitions: list[str],
    database_name: str = GLUE_DATABASE,
) -> None:
    """Registra partições no AWS Glue Catalog em lotes de até 100 partições."""
    if not partitions or not partition_col:
        return

    try:
        location_base = f"s3://{S3_BUCKET}/gold/{table_name}"
        partition_inputs = []

        for part_val in partitions:
            partition_inputs.append(
                {
                    "Values": [str(part_val)],
                    "StorageDescriptor": {
                        "Location": f"{location_base}/{partition_col}={part_val}/",
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
                    DatabaseName=database_name,
                    TableName=table_name,
                    PartitionInputList=batch,
                )
                logger.info(
                    f"[Glue] Partições registradas para '{table_name}': {len(batch)} partições."
                )
            except Exception as exc:
                logger.warning(
                    f"[Glue] Aviso ao registrar partições para '{table_name}': {exc}"
                )

    except Exception as exc:
        logger.error(
            f"[Glue] Erro inesperado ao registrar partições em '{table_name}': {exc}"
        )
