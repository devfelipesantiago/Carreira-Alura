import logging
import re

import pandas as pd

logger = logging.getLogger()


"""Mapeamento e renomeação de colunas:"""


def apply_col_mappings(
    df: pd.DataFrame, col_mappings: dict, table: str
) -> pd.DataFrame:
    renames = {k: v for k, v in col_mappings.items() if isinstance(v, str)}
    if renames:
        df = df.rename(columns=renames)

    domain_maps = {k: v for k, v in col_mappings.items() if isinstance(v, dict)}
    for col, mapping in domain_maps.items():
        if col not in df.columns:
            logger.warning(
                f"[{table}] col_mappings: coluna '{col}' não encontrada - ignorada"
            )


"""Deduplicação baseada em chaves primárias:"""


def apply_dedup(
    df: pd.DataFrame,
    pk_cols: list[str],
    log_dedup: bool,
    table: str,
    source_key: str,
    run_ts: str,
) -> pd.DataFrame:
    valid_pks = [c for c in pk_cols if c in df.columns]
    if not valid_pks:
        logger.warning(
            f"[{table}] dedup: nenhuma pk col válida encontrada - pulando dedup"
        )
        return df

    before = len(df)
    duplicates_mask = df.duplicated(subset=valid_pks, keep="last")


"""Conversões de data com tolerância a múltiplos formatos:"""


def apply_date_conversions(
    df: pd.DataFrame,
    date_cols: list[str],
    table: str,
) -> tuple[pd.DataFrame, dict[str, int]]:
    failures: dict[str, int] = {}

    for col in date_cols:
        if col not in df.columns:
            continue

        df[col] = df[col].replace("", pd.NA)

        parsed = pd.Series(pd.NaT, index=df.index)
        remaining_mask = df[col].notna()


"""Remoção de linhas com FKs nulas:"""


def apply_drop_null_fk(
    df: pd.DataFrame,
    fk_cols: list[str],
    table: str,
    source_key: str,
    run_ts: str,
    dq_log: list[dict],
) -> tuple[pd.DataFrame, int]:
    total_removed = 0

    for col in fk_cols:
        if col not in df.columns:
            continue
        null_mask = df[col].isna() | (df[col].astype(str).str.strip() == "")


"""Aplicação de filtros de validade:"""


def apply_validity_filters(
    df: pd.DataFrame,
    filters: list[dict],
    table: str,
) -> tuple[pd.DataFrame, int]:
    total_removed = 0

    for flt in filters:
        col, op_str, val = flt["col"], flt["op"], flt["val"]
        if col not in df.columns:
            logger.warning(
                f"[{table}] validity_filter: coluna '{col}' não encontrada - ignorada"
            )


"""Normalização de CPF/CNPJ:"""


def _normalize_cpf_cnpj(val: str) -> str | None:
    digits = re.sub(r"[\.\-\/]", "", str(val).strip())
    if len(digits) in (11, 14) and digits.isdigit():
        return digits
    return None


"""Validações de formato:"""


def apply_format_validations(
    df: pd.DataFrame,
    validations: list[dict],
    table: str,
    source_key: str,
    run_ts: str,
    dq_log: list[dict],
) -> tuple[pd.DataFrame, dict[str, int]]:
    nullified: dict[str, int] = {}

    for v in validations:
        col, vtype = v["col"], v["type"]
        if col not in df.columns:
            logger.warning(
                f"[{table}] format_validation: coluna '{col}' não encontrada - ignorada"
            )
            continue

        df[col] = df[col].replace("", pd.NA)
        not_null = df[col].notna()

        if vtype == "email":
            invalid_mask = not_null & ~df[col].str.strip().str.match(_EMAIL_RE)

        elif vtype == "cpf_cnpj":
            lambda v: _normalize_cpf_cnpj(str(v)) if pd.notna(v) else None
            normalized = df[col].apply(
                lambda v: _normalize_cpf_cnpj(str(v)) if pd.notna(v) else None
            )
            invalid_mask = not_null & normalized.isna()
            df.loc[not_null & normalized.notna(), col] = normalized[
                not_null & normalized.notna()
            ]

        else:
            logger.warning(
                f"[{table}] format_validation: tipo '{vtype}' desconhecido - ignorado"
            )
            continue


"""Sinalizações baseadas em outras tabelas e casts a partir do schema da Bronze:"""


def apply_cross_table_flags(
    df: pd.DataFrame,
    flags: list[dict],
    silver_cache: dict[str, pd.DataFrame],
    table: str,
) -> pd.DataFrame:
    for flag in flags:
        flag_col = flag["flag_col"]
        candidate = flag["candidate"]


def apply_schema_casts_from_bronze(
    df: pd.DataFrame,
    schema: dict[str, str],
    table: str,
    date_cols: list[str] | None = None,
) -> tuple[pd.DataFrame, dict[str, int], set[str]]:
    """Aplica cast no DataFrame com base no schema da Bronze.
    Colunas já convertidas em apply_date_conversions são preservadas."""

    cast_failures: dict[str, int] = {}
    date_cols = set(date_cols or [])

    for col, glue_type in schema.items():
        if col not in df.columns:
            continue

        if col in date_cols:
            cast_failures[col] = 0
            continue

        original = df[col].replace("", pd.NA)
        original_not_null = original.notna()
        glue_type = glue_type.lower()


"""Aplicação de flags computadas:"""


def apply_computed_flags(
    df: pd.DataFrame,
    computed_flags: list[dict],
    table: str,
) -> pd.DataFrame:
    for cflag in computed_flags:
        flag_col = cflag["flag_col"]
        expr = cflag["expr"]
        try:
            result = df.eval(expr)
            df[flag_col] = result.fillna(False).astype(bool)
            count = int(df[flag_col].sum())
            logger.info(f"[{table}] computed_flag '{flag_col}': {count} linha(s) True")
        except Exception as exc:
            logger.error(
                f"[{table}] comuted_flag '{flag_col}': erro ao avaliar '{expr}': {exc}"
                f" -> flag setada como False"
            )
            df[flag_col] = False
    return df
