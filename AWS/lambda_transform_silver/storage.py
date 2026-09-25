import io
import logging
import os
from datetime import datetime

import boto3
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

logger = logging.getLogger()

S3_BUCKET = os.environ["S3_BUCKET"]
s3_client = boto3.client("s3")

'''Listagem de objetos no S3 com prefixo específico, retornando uma lista de chaves.'''
def _list_s3_prefix(prefix: str) -> list[str]:
    keys = []
    paginator = s3_client.get_paginator("list_objects_v2")
    for page in paginator.paginate(Bucket=S3_BUCKET, Prefix=prefix):
        for obj in page.get("Contents", []):
            keys.append(obj["Key"])
    return keys

'''Leitura de CSV do S3 e escrita de Parquet no S3, com suporte a exclusão de objetos.'''
def _read_csv_from_s3(key: str) -> pd.DataFrame:
    obj = s3_client.get_object(Bucket=S3_BUCKET, Key=key)
    return pd.read_csv(io.BytesIO(obj["Body"].read()), dtype=str, keep_default_na=False)

'''Gravação de DataFrame como Parquet no S3, com compressão Snappy.'''
def _write_parquet_to_s3(df: pd.DataFrame, key: str) -> None:
    table = pa.Table.from_pandas(df, preserve_index=False)
    buf = io.BytesIO()
    pq.write_table(table, buf, compression="snappy")
    buf.seek(0)
    s3_client.put_object(Bucket=S3_BUCKET, Key=key, Body=buf.read())

'''Exclusão de objetos no S3 em lotes de até 1000 chaves.'''
def _delete_s3_objects(keys: list[str]) -> None:
    for i in range(0, len(keys), 1000):
        batch = [{"Key": k} for k in keys[i : i + 1000]]
        s3_client.delete_objects(Bucket=S3_BUCKET, Delete={"Objects": batch})

'''Busca de arquivos Bronze do dia anterior (D-1) para uma tabela específica, retornando uma lista de chaves.'''
def find_d1_bronze_files(table_name: str, d1_str: str) -> list[str]:
    prefix = f"bronze/{table_name}"
    all_keys = _list_s3_prefix(prefix)
    matched = [k for k in all_keys if d1_str in k.split("/")[-1]]
    logger.info(f"{table_name} D-1={d1_str} -> {len(matched)} arquivo(s) Bronze encontrado(s)")
    return matched

'''Gravação de DataFrame como Parquet na camada Silver do S3, com prefixo baseado em ano e mês.'''
def _silver_prefix(output_name: str, year: int | None = None, month: int | None = None) -> str:
    base = f"silver/{output_name}"
    if year is not None and month is not None:
        return f"{base}/year={year}/month={month:02d}/"
    return f"{base}/"


'''Gravação de DataFrame como Parquet na camada Silver do S3, com prefixo baseado em ano e mês.'''
def save_silver(
    df: pd.DataFrame,
    config: dict,
    run_ts: str,
) -> tuple[list[str], set[tuple[int, int]]]:
    output_name = config["output_name"]
    partition_col = config["partition_col"]
    written_keys: list[str] = []
    partitions_written: set[tuple[int, int]] = set(tuple[int, int], [])

    if partition_col and partition_col in df.columns:
        tmp = df.assign(year=part_dt.dt.year.astype("Int64"), month=part_dt.dt.month.astype("Int64"))

        for (year, month), group in tmp.groupby(["year", "month"], dropna=True):
            partition_df = group.drop(columns=["year", "month"]).reset_index(drop=True)
            year, month = int(year), int(month)
            prefix = _silver_prefix(output_name, year, month)

            old_keys = [k for k in _list_s3_prefix(prefix) if k.endswith(".parquet")]
            if old_keys:
                _delete_s3_objects(old_keys)
                logger.info(f"output_name} Deletados {len(old_keys)} arquivo(s) antigo(s) em {prefix}")

            key = f"{prefix}{output_name}_{run_ts}.parquet"
            _write_parquet_to_s3(partition_df, key)
            written_keys.append(key)
            partitions_written.add((year, month))
            logger.info(f"{output_name} Silver salvo: s3://{S3_BUCKET}/{key} ({len(partition_df)} linhas)")
    else:
        prefix = _silver_prefix(output_name)
        old_keys = [k for k in _list_s3_prefix(prefix) if k.endswith(".parquet")]
        if old_keys:
            _delete_s3_objects(old_keys)
            logger.info(f"{output_name} Deletados {len(old_keys)} arquivo(s) antigo(s) em {prefix}")

        key = f"{prefix}{output_name}_{run_ts}.parquet"
        _write_parquet_to_s3(df, key)
        written_keys.append(key)
        logger.info(f"{output_name} Silver salvo: s3://{S3_BUCKET}/{key} ({len(df)} linhas)")

    return written_keys, partitions_written