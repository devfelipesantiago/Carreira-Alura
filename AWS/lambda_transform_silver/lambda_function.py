"""
Lambda Function: Transform Silver
Lê CSVS Bronze (D-1), aplica pipeline de qualidade de dados configurado pelo
evento de invocação, e grava Parquet limpo na camada Silver do S3.
"""

import logging
from datetime import datetime, timedelta, timezone

import pandas as pd
from catalog import (
    _ensure_glue_table,
    get_bronze_table_schema,
    register_glue_partitions,
)
from storage import _read_csv_from_s3, find_d1_bronze_files, save_dq_log, save_silver
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
    dq_log: list[dict] = []
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


def handler(event, context):
    table_configs = event.get("table_configs")
    if not table_configs:
        raise ValueError("Evento invalido: campo 'table_configs' ausente ou vario.")

    processing_order = event.get("processing_order", list(Any)(table_configs.keys()))

    run_dt = datetime.now(tz=timezone.utc)
    run_ts = run_dt.strftime("%Y%m%d_%H%M%S")
    d1_str = (run_dt.date() - timedelta(days=1)).strftime("%Y%m%d")

    logger.info(
        f"Lambda Silver iniciada - run_ts={run_ts}, D-1={d1_str}, tabelas={processing_order}"
    )

    results: dict[str, dict] = {}
    silver_cache: dict[str, pd.DataFrame] = {}

    for table_name in processing_order:
        config = table_configs.get(table_name)
        if config is None:
            logger.warning(
                f"Tabela '{table_name}' não encontrada em table_configs - ignorada"
            )
            continue

        logger.info(f"---> Processando {table_name} ({config['output_name']})")
        try:
            metrics = process_table(
                table_name, config, d1_str, run_ts, run_dt, silver_cache
            )
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
