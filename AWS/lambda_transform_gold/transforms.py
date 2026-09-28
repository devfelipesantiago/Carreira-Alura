"""
Transforms Module - Camada Gold
Regras puras de transformação dimensional (Star Schema).
Zero dependências de AWS / boto3.
"""

from datetime import date, datetime, timedelta
import numpy as np
import pandas as pd
import pyarrow as pa

# ---------------------------------------------------------------------------
# Schemas PyArrow Explícitos
# ---------------------------------------------------------------------------

DIM_DATE_SCHEMA = pa.schema(
    [
        pa.field("date_key", pa.int32(), nullable=False),
        pa.field("full_date", pa.date32(), nullable=False),
        pa.field("year_number", pa.int32(), nullable=False),
        pa.field("quarter_number", pa.int32(), nullable=False),
        pa.field("quarter_name", pa.string(), nullable=False),
        pa.field("month_number", pa.int32(), nullable=False),
        pa.field("month_name", pa.string(), nullable=False),
        pa.field("month_abbr", pa.string(), nullable=False),
        pa.field("year_month", pa.string(), nullable=False),
        pa.field("week_of_year", pa.int32(), nullable=False),
        pa.field("day_of_month", pa.int32(), nullable=False),
        pa.field("day_of_week", pa.int32(), nullable=False),
        pa.field("day_name", pa.string(), nullable=False),
        pa.field("is_weekend", pa.bool_(), nullable=False),
        pa.field("is_weekday", pa.bool_(), nullable=False),
    ]
)

DIM_CUSTOMERS_SCHEMA = pa.schema(
    [
        pa.field("customer_key", pa.int64(), nullable=False),
        pa.field("customer_name", pa.string(), nullable=True),
        pa.field("customer_email", pa.string(), nullable=True),
        pa.field("customer_tax_id", pa.string(), nullable=True),
        pa.field("person_type_code", pa.string(), nullable=True),
        pa.field("person_type_desc", pa.string(), nullable=True),
        pa.field("state_code", pa.string(), nullable=True),
        pa.field("city_name", pa.string(), nullable=True),
        pa.field("registration_date", pa.timestamp("us"), nullable=True),
        pa.field("is_active", pa.bool_(), nullable=False),
    ]
)

DIM_PRODUCTS_SCHEMA = pa.schema(
    [
        pa.field("product_key", pa.int64(), nullable=False),
        pa.field("product_name", pa.string(), nullable=True),
        pa.field("sku_code", pa.string(), nullable=True),
        pa.field("category_code", pa.string(), nullable=True),
        pa.field("category_name", pa.string(), nullable=True),
        pa.field("list_price", pa.float64(), nullable=True),
        pa.field("standard_cost", pa.float64(), nullable=True),
        pa.field("unit_margin_amount", pa.float64(), nullable=True),
        pa.field("margin_percentage", pa.float64(), nullable=True),
        pa.field("is_active", pa.bool_(), nullable=False),
    ]
)

DIM_CHANNELS_SCHEMA = pa.schema(
    [
        pa.field("channel_key", pa.string(), nullable=False),
        pa.field("channel_name", pa.string(), nullable=False),
        pa.field("channel_type", pa.string(), nullable=False),
    ]
)

FACT_SALES_SCHEMA = pa.schema(
    [
        pa.field("sales_item_sk", pa.string(), nullable=False),
        pa.field("order_id", pa.int64(), nullable=False),
        pa.field("order_item_seq", pa.int64(), nullable=False),
        pa.field("order_date_key", pa.int32(), nullable=False),
        pa.field("payment_date_key", pa.int32(), nullable=False),
        pa.field("customer_key", pa.int64(), nullable=True),
        pa.field("product_key", pa.int64(), nullable=True),
        pa.field("channel_key", pa.string(), nullable=True),
        pa.field("payment_method_code", pa.string(), nullable=True),
        pa.field("quantity", pa.int64(), nullable=False),
        pa.field("unit_price", pa.float64(), nullable=True),
        pa.field("unit_cost", pa.float64(), nullable=True),
        pa.field("gross_item_amount", pa.float64(), nullable=True),
        pa.field("item_discount_amount", pa.float64(), nullable=True),
        pa.field("vl_receita_liquida", pa.float64(), nullable=False),
        pa.field("vl_frete_rateado", pa.float64(), nullable=False),
        pa.field("total_cost_amount", pa.float64(), nullable=True),
        pa.field("gross_profit_amount", pa.float64(), nullable=True),
        pa.field("fl_calc_inconsistente", pa.bool_(), nullable=False),
        pa.field("fl_sem_pgto", pa.bool_(), nullable=False),
        pa.field("order_year_month", pa.string(), nullable=False),
    ]
)

FACT_INVENTORY_SCHEMA = pa.schema(
    [
        pa.field("inventory_sk", pa.string(), nullable=False),
        pa.field("date_key", pa.int32(), nullable=False),
        pa.field("product_key", pa.int64(), nullable=False),
        pa.field("stock_quantity", pa.int64(), nullable=False),
        pa.field("unit_cost", pa.float64(), nullable=True),
        pa.field("unit_price", pa.float64(), nullable=True),
        pa.field("stock_cost_amount", pa.float64(), nullable=True),
        pa.field("stock_sales_potential", pa.float64(), nullable=True),
        pa.field("stock_status", pa.string(), nullable=False),
        pa.field("is_product_active", pa.bool_(), nullable=False),
        pa.field("snapshot_date", pa.date32(), nullable=False),
        pa.field("snapshot_year_month", pa.string(), nullable=False),
    ]
)


# ---------------------------------------------------------------------------
# Builders de Dimensões
# ---------------------------------------------------------------------------


def build_dim_date(
    sources: dict[str, pd.DataFrame] | None = None,
) -> tuple[pd.DataFrame, pa.Schema]:
    """Gera calendário analítico para o período de 2022 a 2026."""
    start_date = date(2022, 1, 1)
    end_date = date(2026, 12, 31)
    days_count = (end_date - start_date).days + 1
    dates = [start_date + timedelta(days=i) for i in range(days_count)]

    month_names_pt = {
        1: "Janeiro",
        2: "Fevereiro",
        3: "Março",
        4: "Abril",
        5: "Maio",
        6: "Junho",
        7: "Julho",
        8: "Agosto",
        9: "Setembro",
        10: "Outubro",
        11: "Novembro",
        12: "Dezembro",
    }
    month_abbr_pt = {
        1: "Jan",
        2: "Fev",
        3: "Mar",
        4: "Abr",
        5: "Mai",
        6: "Jun",
        7: "Jul",
        8: "Ago",
        9: "Set",
        10: "Out",
        11: "Nov",
        12: "Dez",
    }
    day_names_pt = {
        1: "Segunda-feira",
        2: "Terça-feira",
        3: "Quarta-feira",
        4: "Quinta-feira",
        5: "Sexta-feira",
        6: "Sábado",
        7: "Domingo",
    }

    records = []
    for d in dates:
        dt = pd.Timestamp(d)
        dow = dt.isoweekday()  # 1 = Segunda ... 7 = Domingo
        is_wknd = dow in (6, 7)
        q = dt.quarter

        records.append(
            {
                "date_key": int(d.strftime("%Y%m%d")),
                "full_date": d,
                "year_number": int(d.year),
                "quarter_number": int(q),
                "quarter_name": f"{d.year}-T{q}",
                "month_number": int(d.month),
                "month_name": month_names_pt[d.month],
                "month_abbr": month_abbr_pt[d.month],
                "year_month": d.strftime("%Y-%m"),
                "week_of_year": int(dt.isocalendar().week),
                "day_of_month": int(d.day),
                "day_of_week": int(dow),
                "day_name": day_names_pt[dow],
                "is_weekend": bool(is_wknd),
                "is_weekday": bool(not is_wknd),
            }
        )

    df = pd.DataFrame(records)
    return df, DIM_DATE_SCHEMA


def build_dim_customers(
    sources: dict[str, pd.DataFrame],
) -> tuple[pd.DataFrame, pa.Schema]:
    """Constrói dimensão de clientes conformada a partir de silver.clientes."""
    df_src = sources.get("clientes")
    if df_src is None or df_src.empty:
        df = pd.DataFrame(columns=[f.name for f in DIM_CUSTOMERS_SCHEMA])
        return df, DIM_CUSTOMERS_SCHEMA

    df = pd.DataFrame()
    df["customer_key"] = pd.to_numeric(df_src["cod_clie"], errors="coerce").astype(
        "Int64"
    )
    df["customer_name"] = (
        df_src["nm_clie"].astype(str).where(df_src["nm_clie"].notna(), None)
    )
    df["customer_email"] = (
        df_src["ds_email"].astype(str).where(df_src["ds_email"].notna(), None)
    )
    df["customer_tax_id"] = (
        df_src["nr_cpfcnpj"].astype(str).where(df_src["nr_cpfcnpj"].notna(), None)
    )
    df["person_type_code"] = (
        df_src["tp_pessoa"].astype(str).where(df_src["tp_pessoa"].notna(), None)
    )
    df["person_type_desc"] = (
        df_src["tp_pessoa"]
        .map({"F": "Pessoa Física", "J": "Pessoa Jurídica"})
        .fillna("Não Informado")
    )
    df["state_code"] = df_src["cd_uf"].astype(str).where(df_src["cd_uf"].notna(), None)
    df["city_name"] = (
        df_src["nm_cidade"].astype(str).where(df_src["nm_cidade"].notna(), None)
    )
    df["registration_date"] = pd.to_datetime(df_src["dt_cad"], errors="coerce")
    df["is_active"] = pd.to_numeric(df_src["st_ativo"], errors="coerce").fillna(0) == 1

    return df, DIM_CUSTOMERS_SCHEMA


def build_dim_products(
    sources: dict[str, pd.DataFrame],
) -> tuple[pd.DataFrame, pa.Schema]:
    """Constrói dimensão de produtos conformada a partir de silver.produtos."""
    df_src = sources.get("produtos")
    if df_src is None or df_src.empty:
        df = pd.DataFrame(columns=[f.name for f in DIM_PRODUCTS_SCHEMA])
        return df, DIM_PRODUCTS_SCHEMA

    df = pd.DataFrame()
    df["product_key"] = pd.to_numeric(df_src["cod_prod"], errors="coerce").astype(
        "Int64"
    )
    df["product_name"] = (
        df_src["ds_prod"].astype(str).where(df_src["ds_prod"].notna(), None)
    )
    df["sku_code"] = df_src["cd_sku"].astype(str).where(df_src["cd_sku"].notna(), None)
    df["category_code"] = (
        df_src["cd_categ"].astype(str).where(df_src["cd_categ"].notna(), None)
    )
    df["category_name"] = (
        df_src["ds_categ"]
        .astype(str)
        .str.upper()
        .where(df_src["ds_categ"].notna(), None)
    )

    price = pd.to_numeric(df_src["vl_preco"], errors="coerce").fillna(0.0).astype(float)
    cost = pd.to_numeric(df_src["vl_custo"], errors="coerce").fillna(0.0).astype(float)
    margin = price - cost
    margin_pct = np.where(price > 0, margin / price, 0.0)

    df["list_price"] = price.round(2)
    df["standard_cost"] = cost.round(2)
    df["unit_margin_amount"] = margin.round(2)
    df["margin_percentage"] = margin_pct.round(4)
    df["is_active"] = pd.to_numeric(df_src["st_ativo"], errors="coerce").fillna(0) == 1

    return df, DIM_PRODUCTS_SCHEMA


def build_dim_channels(
    sources: dict[str, pd.DataFrame],
) -> tuple[pd.DataFrame, pa.Schema]:
    """Constrói dimensão de canais conformada a partir de silver.pedidos."""
    df_src = sources.get("pedidos")
    if df_src is None or df_src.empty:
        df = pd.DataFrame(columns=[f.name for f in DIM_CHANNELS_SCHEMA])
        return df, DIM_CHANNELS_SCHEMA

    unique_channels = df_src["cd_canal"].dropna().unique()
    channel_name_map = {
        "WEBSITE": "Website Oficial",
        "APP_MOBILE": "App Mobile",
        "WHATSAPP": "Vendas WhatsApp",
        "MARKETPLACE": "Marketplaces Parceiros",
        "INSTAGRAM": "Instagram Shopping",
        "LOJA_FISICA": "Loja Física",
    }
    channel_type_map = {
        "WEBSITE": "E-commerce Próprio",
        "APP_MOBILE": "E-commerce Próprio",
        "WHATSAPP": "Social / Messaging",
        "INSTAGRAM": "Social / Messaging",
        "MARKETPLACE": "Marketplace Terceiro",
        "LOJA_FISICA": "Varejo Físico",
    }

    records = []
    for ch in unique_channels:
        ch_str = str(ch).strip()
        if not ch_str:
            continue
        records.append(
            {
                "channel_key": ch_str,
                "channel_name": channel_name_map.get(ch_str, ch_str),
                "channel_type": channel_type_map.get(ch_str, "Outros"),
            }
        )

    df = pd.DataFrame(records)
    if df.empty:
        df = pd.DataFrame(columns=[f.name for f in DIM_CHANNELS_SCHEMA])
    return df, DIM_CHANNELS_SCHEMA


# ---------------------------------------------------------------------------
# Builders de Fatos
# ---------------------------------------------------------------------------


def build_fact_sales(
    sources: dict[str, pd.DataFrame],
) -> tuple[pd.DataFrame, pa.Schema]:
    """Constrói fato de vendas com granularidade de 1 linha por item de pedido pago.

    Aplica filtros de negócio:
    - cd_status == 'PAGO'
    - Rateio proporcional de frete
    - Cálculo de receita líquida e margem de lucro
    """
    df_pedidos = sources.get("pedidos")
    df_itens = sources.get("itens_pedido")
    df_produtos = sources.get("produtos")

    if df_pedidos is None or df_pedidos.empty or df_itens is None or df_itens.empty:
        df = pd.DataFrame(columns=[f.name for f in FACT_SALES_SCHEMA])
        return df, FACT_SALES_SCHEMA

    # Filtro base: apenas pedidos pagos
    pedidos_pagos = df_pedidos[df_pedidos["cd_status"] == "PAGO"].copy()
    if pedidos_pagos.empty:
        df = pd.DataFrame(columns=[f.name for f in FACT_SALES_SCHEMA])
        return df, FACT_SALES_SCHEMA

    # Conversão de tipos nos pedidos
    pedidos_pagos["nr_ov"] = pd.to_numeric(
        pedidos_pagos["nr_ov"], errors="coerce"
    ).astype("Int64")
    pedidos_pagos["cod_clie"] = pd.to_numeric(
        pedidos_pagos["cod_clie"], errors="coerce"
    ).astype("Int64")
    pedidos_pagos["dt_ov"] = pd.to_datetime(pedidos_pagos["dt_ov"], errors="coerce")
    pedidos_pagos["dt_pgto"] = pd.to_datetime(
        pedidos_pagos["dt_pgto"], errors="coerce"
    ).fillna(pedidos_pagos["dt_ov"])
    pedidos_pagos["vl_frete"] = (
        pd.to_numeric(pedidos_pagos["vl_frete"], errors="coerce")
        .fillna(0.0)
        .astype(float)
    )
    pedidos_pagos["fl_sem_pgto"] = (
        pedidos_pagos["fl_sem_pgto"].fillna(False).astype(bool)
        if "fl_sem_pgto" in pedidos_pagos.columns
        else False
    )

    # Conversão de tipos nos itens
    itens = df_itens.copy()
    itens["nr_ov"] = pd.to_numeric(itens["nr_ov"], errors="coerce").astype("Int64")
    itens["nr_seq"] = pd.to_numeric(itens["nr_seq"], errors="coerce").astype("Int64")
    itens["cod_prod"] = pd.to_numeric(itens["cod_prod"], errors="coerce").astype(
        "Int64"
    )
    itens["qt_item"] = (
        pd.to_numeric(itens["qt_item"], errors="coerce").fillna(1).astype("int64")
    )
    itens["vl_unit"] = (
        pd.to_numeric(itens["vl_unit"], errors="coerce").fillna(0.0).astype(float)
    )
    itens["vl_tot_item"] = (
        pd.to_numeric(itens["vl_tot_item"], errors="coerce").fillna(0.0).astype(float)
    )
    itens["vl_desc_item"] = (
        pd.to_numeric(itens["vl_desc_item"], errors="coerce").fillna(0.0).astype(float)
    )
    itens["fl_calc_inconsistente"] = (
        itens["fl_calc_inconsistente"].fillna(False).astype(bool)
        if "fl_calc_inconsistente" in itens.columns
        else False
    )

    # Join Itens x Pedidos Pagos
    merged = pd.merge(itens, pedidos_pagos, on="nr_ov", how="inner")

    if merged.empty:
        df = pd.DataFrame(columns=[f.name for f in FACT_SALES_SCHEMA])
        return df, FACT_SALES_SCHEMA

    # Join com Produtos para obter custo unitário
    if df_produtos is not None and not df_produtos.empty:
        prod_costs = df_produtos[["cod_prod", "vl_custo"]].copy()
        prod_costs["cod_prod"] = pd.to_numeric(
            prod_costs["cod_prod"], errors="coerce"
        ).astype("Int64")
        prod_costs["vl_custo"] = (
            pd.to_numeric(prod_costs["vl_custo"], errors="coerce")
            .fillna(0.0)
            .astype(float)
        )
        merged = pd.merge(merged, prod_costs, on="cod_prod", how="left")
    else:
        merged["vl_custo"] = 0.0

    # Rateio do Frete Proporcional ao valor do item dentro do pedido
    order_totals = (
        itens.groupby("nr_ov")["vl_tot_item"]
        .sum()
        .reset_index()
        .rename(columns={"vl_tot_item": "tot_ov_itens"})
    )
    merged = pd.merge(merged, order_totals, on="nr_ov", how="left")
    merged["tot_ov_itens"] = merged["tot_ov_itens"].fillna(0.0)

    freight_ratio = np.where(
        merged["tot_ov_itens"] > 0, merged["vl_tot_item"] / merged["tot_ov_itens"], 0.0
    )
    merged["vl_frete_rateado"] = (merged["vl_frete"] * freight_ratio).round(2)

    # Métricas de Faturamento
    merged["vl_receita_liquida"] = (
        merged["vl_tot_item"] - merged["vl_desc_item"]
    ).round(2)
    merged["total_cost_amount"] = (
        merged["qt_item"] * merged["vl_custo"].fillna(0.0)
    ).round(2)
    merged["gross_profit_amount"] = (
        merged["vl_receita_liquida"] - merged["total_cost_amount"]
    ).round(2)

    # Chaves de Data no formato YYYYMMDD
    merged["order_date_key"] = merged["dt_ov"].dt.strftime("%Y%m%d").astype(int)
    merged["payment_date_key"] = merged["dt_pgto"].dt.strftime("%Y%m%d").astype(int)
    merged["order_year_month"] = merged["dt_ov"].dt.strftime("%Y-%m")

    # Surrogate Key
    merged["sales_item_sk"] = (
        merged["nr_ov"].astype(str) + "-" + merged["nr_seq"].astype(str)
    )

    # Montagem final do DataFrame
    df = pd.DataFrame(
        {
            "sales_item_sk": merged["sales_item_sk"],
            "order_id": merged["nr_ov"],
            "order_item_seq": merged["nr_seq"],
            "order_date_key": merged["order_date_key"].astype("int32"),
            "payment_date_key": merged["payment_date_key"].astype("int32"),
            "customer_key": merged["cod_clie"],
            "product_key": merged["cod_prod"],
            "channel_key": merged["cd_canal"].astype(str),
            "payment_method_code": merged["cd_pgto"]
            .astype(str)
            .where(merged["cd_pgto"].notna(), None),
            "quantity": merged["qt_item"].astype("int64"),
            "unit_price": merged["vl_unit"].astype(float).round(2),
            "unit_cost": merged["vl_custo"].fillna(0.0).astype(float).round(2),
            "gross_item_amount": merged["vl_tot_item"].astype(float).round(2),
            "item_discount_amount": merged["vl_desc_item"].astype(float).round(2),
            "vl_receita_liquida": merged["vl_receita_liquida"].astype(float).round(2),
            "vl_frete_rateado": merged["vl_frete_rateado"].astype(float).round(2),
            "total_cost_amount": merged["total_cost_amount"].astype(float).round(2),
            "gross_profit_amount": merged["gross_profit_amount"].astype(float).round(2),
            "fl_calc_inconsistente": merged["fl_calc_inconsistente"].astype(bool),
            "fl_sem_pgto": merged["fl_sem_pgto"].astype(bool),
            "order_year_month": merged["order_year_month"].astype(str),
        }
    )

    return df, FACT_SALES_SCHEMA


def build_fact_inventory(
    sources: dict[str, pd.DataFrame],
) -> tuple[pd.DataFrame, pa.Schema]:
    """Constrói fato de inventário com granularidade de snapshot diário por produto."""
    df_src = sources.get("produtos")
    if df_src is None or df_src.empty:
        df = pd.DataFrame(columns=[f.name for f in FACT_INVENTORY_SCHEMA])
        return df, FACT_INVENTORY_SCHEMA

    today = date.today()
    date_key = int(today.strftime("%Y%m%d"))
    snapshot_year_month = today.strftime("%Y-%m")

    prod_ids = pd.to_numeric(df_src["cod_prod"], errors="coerce").astype("Int64")
    stock_qty = (
        pd.to_numeric(df_src["qt_estq"], errors="coerce").fillna(0).astype("int64")
    )
    unit_cost = (
        pd.to_numeric(df_src["vl_custo"], errors="coerce").fillna(0.0).astype(float)
    )
    unit_price = (
        pd.to_numeric(df_src["vl_preco"], errors="coerce").fillna(0.0).astype(float)
    )
    is_active = pd.to_numeric(df_src["st_ativo"], errors="coerce").fillna(0) == 1

    stock_cost = (stock_qty * unit_cost).round(2)
    stock_potential = (stock_qty * unit_price).round(2)

    status = np.where(
        stock_qty <= 0,
        "ESGOTADO",
        np.where(stock_qty < 50, "ESTOQUE_BAIXO", "ESTOQUE_NORMAL"),
    )

    inv_sk = f"{date_key}-" + prod_ids.astype(str)

    df = pd.DataFrame(
        {
            "inventory_sk": inv_sk,
            "date_key": int(date_key),
            "product_key": prod_ids,
            "stock_quantity": stock_qty,
            "unit_cost": unit_cost.round(2),
            "unit_price": unit_price.round(2),
            "stock_cost_amount": stock_cost,
            "stock_sales_potential": stock_potential,
            "stock_status": status,
            "is_product_active": is_active,
            "snapshot_date": today,
            "snapshot_year_month": snapshot_year_month,
        }
    )

    return df, FACT_INVENTORY_SCHEMA
