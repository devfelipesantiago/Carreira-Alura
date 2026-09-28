"""
Lambda Function: Transform Silver
Lê CSVs Bronze (D-1), aplica pipeline de qualidade de dados configurado pelo
evento de invocação, e grava Parquet limpo na camada Silver do S3.
"""

import logging
from datetime import datetime, timedelta, timezone

import pandas as pd
from catalog import (
    ensure_glue_table,
    get_bronze_table_schema,
    register_glue_partitions,
)
from storage import _read_csv_from_s3, find_d1_bronze_files, save_silver
from config import PROCESSING_ORDER, TABLE_CONFIG
from transforms import (
    apply_col_mappings,
    apply_computed_flags,
    apply_cross_table_flags,
    apply_date_conversions,
    apply_dedup,
    apply_drop_null_fk,
    apply_format_validations,
    apply_schema_casts_from_bronze,
    apply_validity_filters,
)

# Logger configurado no nível de módulo — disponível em todo o arquivo.
# O objeto precisa existir antes de qualquer chamada ao handler.
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("lambda_transform_silver")
logger.setLevel(logging.INFO)


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def _to_native(obj):
    """Converte tipos numpy/pandas para tipos nativos Python, tornando o
    objeto serializável em JSON (necessário para o retorno do Lambda)."""
    if isinstance(obj, dict):
        return {k: _to_native(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [_to_native(i) for i in obj]
    try:
        import numpy as np
        if isinstance(obj, np.integer):
            return int(obj)
        if isinstance(obj, np.floating):
            return float(obj)
        if isinstance(obj, np.bool_):
            return bool(obj)
    except ImportError:
        pass
    try:
        if obj is not None and hasattr(obj, '__class__') and 'NA' in type(obj).__name__:
            return None
        import pandas as pd
        if pd.isna(obj):
            return None
    except (TypeError, ValueError):
        pass
    return obj


# ---------------------------------------------------------------------------
# Processamento por tabela
# ---------------------------------------------------------------------------


def process_table(
    table_name: str,
    config: dict,
    d1_str: str,
    run_ts: str,
    run_dt: datetime,
    silver_cache: dict[str, pd.DataFrame],
) -> dict:
    output_name = config["output_name"]
    pk_cols = config["pk_cols"]
    metrics: dict = {
        "rows_bronze": 0,
        "rows_after_dedup": 0,
        "rows_removed_fk": 0,
        "rows_removed_filter": 0,
        "fields_nullified": {},
        "date_parse_failures": {},
        "cast_failures": {},
        "s3_keys": [],
        "status": "ok",
    }

    # 1. Lê arquivos Bronze D-1
    bronze_files = find_d1_bronze_files(table_name, d1_str)
    if not bronze_files:
        logger.warning(f"[{table_name}] Nenhum arquivo Bronze encontrado para D-1={d1_str}")
        metrics["status"] = "no_data"
        return metrics

    frames = [_read_csv_from_s3(key) for key in bronze_files]
    df = pd.concat(frames, ignore_index=True)
    metrics["rows_bronze"] = len(df)

    # 2. Pipeline de qualidade de dados
    bronze_schema = get_bronze_table_schema(table_name)
    df, cast_failures = apply_schema_casts_from_bronze(
        df, bronze_schema, table=table_name, date_cols=config.get("date_cols", [])
    )
    metrics["cast_failures"] = cast_failures

    df = apply_dedup(df, pk_cols, table=table_name)
    metrics["rows_after_dedup"] = len(df)

    df, rows_removed_fk = apply_drop_null_fk(
        df, config.get("drop_null_fk", []), table=table_name
    )
    metrics["rows_removed_fk"] = rows_removed_fk

    df, fields_nullified = apply_format_validations(
        df, config.get("format_validations", []), table=table_name
    )
    metrics["fields_nullified"] = fields_nullified

    df, date_failures = apply_date_conversions(
        df, config.get("date_cols", []), table=table_name
    )
    metrics["date_parse_failures"] = date_failures

    # Mapeamentos vêm antes das validações que dependem do domínio canônico.
    df = apply_col_mappings(df, config.get("col_mappings", {}), table=table_name)
    df = apply_computed_flags(df, config.get("computed_flags", []), table=table_name)
    df = apply_cross_table_flags(
        df, config.get("cross_table_flags", []), silver_cache, table=table_name
    )

    df, rows_removed_filter = apply_validity_filters(
        df, config.get("validity_filters", []), table=table_name
    )
    metrics["rows_removed_filter"] = rows_removed_filter

    # 3. Salva Silver Parquet e atualiza cache
    s3_keys, partitions_written = save_silver(df, config, run_ts)
    metrics["s3_keys"] = s3_keys
    silver_cache[output_name] = df

    # 4. Registra tabela/partições no Glue Catalog
    partitioned = bool(config.get("partition_col"))
    ensure_glue_table(output_name, df, partitioned)
    register_glue_partitions(output_name, partitions_written)

    logger.info(
        f"[{table_name}] OK — bronze={metrics['rows_bronze']}, "
        f"silver={len(df)}, s3_keys={s3_keys}"
    )
    return metrics


# ---------------------------------------------------------------------------
# Handler (entrypoint do Lambda)
# ---------------------------------------------------------------------------


def handler(event, context):
    # O config versionado no pacote é a fonte única; o evento só pode
    # selecionar uma ordem/subconjunto sem criar lógica por tabela.
    requested_tables = event.get("tables")
    table_configs = TABLE_CONFIG
    processing_order = event.get(
        "processing_order",
        [name for name in PROCESSING_ORDER if not requested_tables or name in requested_tables],
    )

    run_dt = datetime.now(tz=timezone.utc)
    run_ts = run_dt.strftime("%Y%m%d_%H%M%S")
    d1_str = (run_dt.date() - timedelta(days=1)).strftime("%Y%m%d")

    logger.info(f"Lambda Silver iniciada - run_ts={run_ts}, D-1={d1_str}, tabelas={processing_order}")

    results: dict[str, dict] = {}
    silver_cache: dict[str, pd.DataFrame] = {}

    for table_name in processing_order:
        config = table_configs.get(table_name)
        if config is None:
            logger.warning(f"Tabela '{table_name}' não encontrada em table_configs - ignorada")
            continue

        logger.info(f"---> Processando {table_name} ({config['output_name']})")
        try:
            metrics = process_table(table_name, config, d1_str, run_ts, run_dt, silver_cache)
            results[config["output_name"]] = metrics
        except Exception as exc:
            logger.error(f"[{table_name}] ERRO não recuperável: {exc}", exc_info=True)
            results[config["output_name"]] = {"status": "error", "error": str(exc)}

    logger.info("Lambda Silver finalizada")
    return {
        "statusCode": 200,
        "body": _to_native(
            {
                "run_timestamp": run_ts,
                "d1_date": d1_str,
                "tables": results,
            }
        ),
    }
