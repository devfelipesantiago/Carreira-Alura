"""
Storage Module - Camada Gold
Funções auxiliares para leitura da camada Silver e escrita Parquet na Gold.
"""

import io
import logging
import os

import boto3
import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq

logger = logging.getLogger(__name__)

S3_BUCKET = os.environ.get("S3_BUCKET", "")
s3_client = boto3.client("s3")


# ---------------------------------------------------------------------------
# S3 Helpers
# ---------------------------------------------------------------------------


def _list_s3_prefix(prefix: str) -> list[str]:
    """Lista todas as chaves de objetos com o prefixo especificado no bucket."""
    keys = []
    paginator = s3_client.get_paginator("list_objects_v2")
    for page in paginator.paginate(Bucket=S3_BUCKET, Prefix=prefix):
        for obj in page.get("Contents", []):
            keys.append(obj["Key"])
    return keys


def _delete_s3_objects(keys: list[str]) -> None:
    """Exclui objetos no S3 em lotes de até 1000 chaves."""
    if not keys:
        return
    for i in range(0, len(keys), 1000):
        batch = [{"Key": k} for k in keys[i : i + 1000]]
        s3_client.delete_objects(Bucket=S3_BUCKET, Delete={"Objects": batch})
        logger.info(f"Deletados {len(batch)} arquivos antigos do S3")


def _read_parquet_from_s3(key: str) -> pd.DataFrame:
    """Lê um arquivo Parquet do S3 e retorna um DataFrame do pandas."""
    obj = s3_client.get_object(Bucket=S3_BUCKET, Key=key)
    buf = io.BytesIO(obj["Body"].read())
    table = pq.read_table(buf)
    return table.to_pandas()


def _write_parquet_to_s3(table: pa.Table, key: str) -> None:
    """Escreve um PyArrow Table como Parquet com compressão Snappy no S3."""
    buf = io.BytesIO()
    pq.write_table(table, buf, compression="snappy")
    buf.seek(0)
    s3_client.put_object(
        Bucket=S3_BUCKET,
        Key=key,
        Body=buf.read(),
        ContentType="application/octet-stream",
    )


# ---------------------------------------------------------------------------
# Leitura da Camada Silver
# ---------------------------------------------------------------------------


def read_silver(table_name: str) -> pd.DataFrame:
    """Lê todos os arquivos Parquet de uma tabela na camada Silver do S3.

    Procura por arquivos sob o prefixo `silver/{table_name}/`.
    """
    prefix = f"silver/{table_name}/"
    keys = [k for k in _list_s3_prefix(prefix) if k.endswith(".parquet")]

    if not keys:
        logger.warning(
            f"[Silver] Nenhum arquivo Parquet encontrado em s3://{S3_BUCKET}/{prefix}"
        )
        return pd.DataFrame()

    logger.info(f"[Silver] Lendo {len(keys)} arquivo(s) de s3://{S3_BUCKET}/{prefix}")
    frames = [_read_parquet_from_s3(k) for k in keys]
    df_concat = pd.concat(frames, ignore_index=True)
    logger.info(
        f"[Silver] Total de {len(df_concat)} linha(s) carregada(s) de '{table_name}'"
    )
    return df_concat


# ---------------------------------------------------------------------------
# Gravação da Camada Gold
# ---------------------------------------------------------------------------


def save_gold(
    df: pd.DataFrame,
    table_name: str,
    schema: pa.Schema,
    partition_col: str | None,
    is_append: bool,
    run_ts: str,
) -> tuple[list[str], list[str]]:
    """Grava o DataFrame na camada Gold do S3 com PyArrow schema explícito e Snappy.

    Estratégia:
    - Full Replace (is_append=False): apaga arquivos anteriores antes de gravar.
    - Append (is_append=True): apenas adiciona novo arquivo sem deletar partições existentes.
    """
    written_keys: list[str] = []
    partitions_written: list[str] = []

    if df.empty:
        logger.warning(
            f"[Gold] DataFrame de '{table_name}' está vazio. Nenhum arquivo salvo."
        )
        return [], []

    if partition_col and partition_col in df.columns:
        # Particionamento Hive-style
        for part_val, group in df.groupby(partition_col, dropna=True):
            part_str = str(part_val)
            prefix = f"gold/{table_name}/{partition_col}={part_str}/"

            if not is_append:
                old_keys = [
                    k for k in _list_s3_prefix(prefix) if k.endswith(".parquet")
                ]
                if old_keys:
                    _delete_s3_objects(old_keys)
                    logger.info(
                        f"[Gold] Limpeza Full Replace: {len(old_keys)} arquivo(s) em {prefix}"
                    )

            key = f"{prefix}{table_name}_{run_ts}.parquet"
            # Converte com schema explícito
            table_pa = pa.Table.from_pandas(group, schema=schema, preserve_index=False)
            _write_parquet_to_s3(table_pa, key)

            written_keys.append(key)
            partitions_written.append(part_str)
            logger.info(f"[Gold] Salvo: s3://{S3_BUCKET}/{key} ({len(group)} linhas)")
    else:
        prefix = f"gold/{table_name}/"

        if not is_append:
            old_keys = [k for k in _list_s3_prefix(prefix) if k.endswith(".parquet")]
            if old_keys:
                _delete_s3_objects(old_keys)
                logger.info(
                    f"[Gold] Limpeza Full Replace: {len(old_keys)} arquivo(s) em {prefix}"
                )

        key = f"{prefix}{table_name}_{run_ts}.parquet"
        table_pa = pa.Table.from_pandas(df, schema=schema, preserve_index=False)
        _write_parquet_to_s3(table_pa, key)

        written_keys.append(key)
        logger.info(f"[Gold] Salvo: s3://{S3_BUCKET}/{key} ({len(df)} linhas)")

    return written_keys, sorted(list(set(partitions_written)))
