"""
Lambda Function: Transform Gold
Lê tabelas da camada Silver, aplica modelagem dimensional (Star Schema)
e grava tabelas analíticas Parquet na camada Gold do S3, registrando no Glue Catalog.
"""

from datetime import datetime, timezone
import logging
import os

import pandas as pd

from catalog import ensure_glue_table, register_glue_partitions
from storage import read_silver, save_gold
from transforms import (
    build_dim_channels,
    build_dim_customers,
    build_dim_date,
    build_dim_products,
    build_fact_inventory,
    build_fact_sales,
)

logger = logging.getLogger(__name__)
logging.basicConfig(level=logging.INFO)


# ---------------------------------------------------------------------------
# Mapeamentos e Configurações por Tabela Gold
# ---------------------------------------------------------------------------

# Mapeia cada tabela Gold às fontes Silver estritamente necessárias
SOURCES: dict[str, list[str]] = {
    "dim_date": [],
    "dim_customers": ["clientes"],
    "dim_products": ["produtos"],
    "dim_channels": ["pedidos"],
    "fact_sales": ["pedidos", "itens_pedido", "produtos"],
    "fact_inventory": ["produtos"],
}

# Funções construtoras em transforms.py
BUILDERS = {
    "dim_date": build_dim_date,
    "dim_customers": build_dim_customers,
    "dim_products": build_dim_products,
    "dim_channels": build_dim_channels,
    "fact_sales": build_fact_sales,
    "fact_inventory": build_fact_inventory,
}

# Coluna de particionamento (ou None)
PARTITIONED: dict[str, str | None] = {
    "dim_date": None,
    "dim_customers": None,
    "dim_products": None,
    "dim_channels": None,
    "fact_sales": "order_year_month",
    "fact_inventory": "snapshot_year_month",
}

# Estratégia de carga: True = Append (mantém partições anteriores), False = Full Replace (apaga e regrava)
APPEND: dict[str, bool] = {
    "dim_date": False,
    "dim_customers": False,
    "dim_products": False,
    "dim_channels": False,
    "fact_sales": False,
    "fact_inventory": True,
}


# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------


def _to_native(obj):
    """Converte estruturas e tipos numpy/pandas para tipos nativos Python serializáveis."""
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
        if obj is not None and hasattr(obj, "__class__") and "NA" in type(obj).__name__:
            return None
        if pd.isna(obj):
            return None
    except (TypeError, ValueError):
        pass
    return obj


# ---------------------------------------------------------------------------
# Handler Principal
# ---------------------------------------------------------------------------


def handler(event, context):
    """Entrypoint da Lambda Gold.

    Processa exatamente UMA tabela por invocação: `{"table": "nome_tabela"}`.
    """
    target_table = event.get("table")
    if not target_table:
        raise ValueError(
            "Evento inválido: campo 'table' é obrigatório. "
            f"Tabelas disponíveis: {list(BUILDERS.keys())}"
        )

    if target_table not in BUILDERS:
        raise ValueError(
            f"Tabela desconhecida '{target_table}'. "
            f"Tabelas disponíveis: {list(BUILDERS.keys())}"
        )

    run_dt = datetime.now(tz=timezone.utc)
    run_ts = run_dt.strftime("%Y%m%d_%H%M%S")

    logger.info(
        f"===> Iniciando processamento Gold para '{target_table}' (run_ts={run_ts})"
    )

    # 1. Carrega apenas as fontes Silver necessárias
    required_sources = SOURCES.get(target_table, [])
    loaded_sources: dict[str, pd.DataFrame] = {}
    for src in required_sources:
        loaded_sources[src] = read_silver(src)

    # 2. Executa builder dimensional
    builder_fn = BUILDERS[target_table]
    df, schema = builder_fn(loaded_sources)
    logger.info(f"[{target_table}] Linhas geradas: {len(df)}")

    # 3. Salva na camada Gold do S3
    partition_col = PARTITIONED.get(target_table)
    is_append = APPEND.get(target_table, False)

    s3_keys, partitions = save_gold(
        df=df,
        table_name=target_table,
        schema=schema,
        partition_col=partition_col,
        is_append=is_append,
        run_ts=run_ts,
    )

    # 4. Registra tabela e partições no AWS Glue Catalog
    ensure_glue_table(
        table_name=target_table,
        schema=schema,
        partition_col=partition_col,
    )

    if partition_col and partitions:
        register_glue_partitions(
            table_name=target_table,
            partition_col=partition_col,
            partitions=partitions,
        )

    logger.info(
        f"===> Finalizado processamento Gold para '{target_table}' com sucesso!"
    )

    # 5. Retorna métricas obrigatórias
    return {
        "statusCode": 200,
        "body": _to_native(
            {
                "table": target_table,
                "rows_written": len(df),
                "s3_key": s3_keys[0] if s3_keys else None,
                "s3_keys": s3_keys,
                "partitions": partitions,
                "run_ts": run_ts,
                "status": "ok",
            }
        ),
    }
