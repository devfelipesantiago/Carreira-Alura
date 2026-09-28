import logging
import re

import pandas as pd

from config import DATE_FORMATS, _EMAIL_RE, _OPS

logger = logging.getLogger(__name__)


# ---------------------------------------------------------------------------
# Mapeamento e renomeação de colunas
# ---------------------------------------------------------------------------


def apply_col_mappings(
    df: pd.DataFrame, col_mappings: dict, table: str
) -> pd.DataFrame:
    """Aplica renomeações estruturais (str→str) e normalização de domínio
    (str→dict).

    Para normalização de domínio, valores dentro do mapeamento são
    substituídos pelo canônico; valores FORA do mapeamento recebem
    .str.upper() como fallback (Princípio 4: sem falhas silenciosas, valor
    original nunca passa adiante sem transformação).
    """
    # Renomeações de coluna: {"nome_antigo": "nome_novo"}
    renames = {k: v for k, v in col_mappings.items() if isinstance(v, str)}
    if renames:
        df = df.rename(columns=renames)

    # Normalização de domínio: {"coluna": {"val1": "CANONICO", ...}}
    domain_maps = {k: v for k, v in col_mappings.items() if isinstance(v, dict)}
    for col, mapping in domain_maps.items():
        if col not in df.columns:
            logger.warning(
                f"[{table}] col_mappings: coluna '{col}' não encontrada - ignorada"
            )
            continue

        # Valores mapeados → canônico; valores não mapeados → .str.upper()
        mapped = df[col].map(mapping)
        not_in_map = mapped.isna() & df[col].notna()
        unmapped_count = int(not_in_map.sum())
        if unmapped_count:
            logger.info(
                f"[{table}] col_mappings '{col}': {unmapped_count} valor(es) "
                f"não mapeado(s) → aplicando .str.upper() como fallback"
            )
        fallback = df[col].astype("string").str.strip().str.upper()
        mapped = mapped.where(~not_in_map, fallback)
        df[col] = mapped

    return df


# ---------------------------------------------------------------------------
# Deduplicação baseada em chaves primárias
# ---------------------------------------------------------------------------


def apply_dedup(
    df: pd.DataFrame,
    pk_cols: list[str],
    table: str,
) -> pd.DataFrame:
    valid_pks = [c for c in pk_cols if c in df.columns]
    if not valid_pks:
        logger.warning(
            f"[{table}] dedup: nenhuma pk col válida encontrada - pulando dedup"
        )
        return df

    before = len(df)
    df = df.drop_duplicates(subset=valid_pks, keep="last").reset_index(drop=True)
    removed = before - len(df)
    if removed:
        logger.info(f"[{table}] dedup: {removed} linha(s) duplicada(s) removida(s)")
    return df


# ---------------------------------------------------------------------------
# Conversões de data com tolerância a múltiplos formatos
# ---------------------------------------------------------------------------


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

        parsed = pd.Series(pd.NaT, index=df.index, dtype="datetime64[ns]")
        remaining_mask = df[col].notna()

        for fmt in DATE_FORMATS:
            if not remaining_mask.any():
                break
            converted = pd.to_datetime(
                df.loc[remaining_mask, col], format=fmt, errors="coerce"
            )
            success = converted.notna()
            parsed.loc[remaining_mask[remaining_mask].index[success]] = converted[success].values
            remaining_mask.loc[remaining_mask[remaining_mask].index[success]] = False

        fail_count = int(remaining_mask.sum())
        if fail_count:
            logger.warning(
                f"[{table}] date_conversions: {fail_count} valor(es) inválido(s) em '{col}' → NaT"
            )
        failures[col] = fail_count
        df[col] = parsed

    return df, failures


# ---------------------------------------------------------------------------
# Remoção de linhas com FKs nulas
# ---------------------------------------------------------------------------


def apply_drop_null_fk(
    df: pd.DataFrame,
    fk_cols: list[str],
    table: str,
) -> tuple[pd.DataFrame, int]:
    """Remove linhas com FK nula/vazia.

    Remoção justificada: uma linha de item de pedido sem cod_prod não tem
    como ser agregada por produto em qualquer análise downstream — é
    estruturalmente inútil (Princípio 2c).
    """
    total_removed = 0

    for col in fk_cols:
        if col not in df.columns:
            continue
        null_mask = df[col].isna() | (df[col].astype(str).str.strip() == "")
        count = int(null_mask.sum())
        if count:
            logger.warning(
                f"[{table}] drop_null_fk: {count} linha(s) removida(s) por FK nula em '{col}'"
            )
            df = df[~null_mask].reset_index(drop=True)
            total_removed += count

    return df, total_removed


# ---------------------------------------------------------------------------
# Aplicação de filtros de validade
# ---------------------------------------------------------------------------


def apply_validity_filters(
    df: pd.DataFrame,
    filters: list[dict],
    table: str,
) -> tuple[pd.DataFrame, int]:
    """Remove linhas que não satisfazem o filtro numérico.

    Formato esperado de cada filtro:
        {"col": "qt_item", "op": ">", "val": 0}
    """
    total_removed = 0

    for flt in filters:
        col = flt.get("col")
        op_str = flt.get("op")
        val = flt.get("val")

        if not col or not op_str or val is None:
            logger.warning(
                f"[{table}] validity_filter: filtro mal-formado {flt} - ignorado"
            )
            continue

        if col not in df.columns:
            logger.warning(
                f"[{table}] validity_filter: coluna '{col}' não encontrada - ignorada"
            )
            continue

        op_fn = _OPS.get(op_str)
        if op_fn is None:
            logger.warning(f"[{table}] validity_filter: operador '{op_str}' desconhecido - ignorado")
            continue

        try:
            numeric_values = pd.to_numeric(df[col], errors="coerce")
            invalid_mask = numeric_values.isna() | ~op_fn(numeric_values, val)
            count = int(invalid_mask.sum())
            if count:
                logger.warning(
                    f"[{table}] validity_filter: {count} linha(s) removida(s) ({col} {op_str} {val})"
                )
                df = df[~invalid_mask].reset_index(drop=True)
                total_removed += count
        except Exception as exc:
            logger.error(f"[{table}] validity_filter: erro ao aplicar filtro '{col} {op_str} {val}': {exc}")

    return df, total_removed


# ---------------------------------------------------------------------------
# Normalização de CPF/CNPJ
# ---------------------------------------------------------------------------


def _normalize_cpf_cnpj(val: str) -> str | None:
    digits = re.sub(r"[\.\-\/]", "", str(val).strip())
    if len(digits) in (11, 14) and digits.isdigit():
        return digits
    return None


# ---------------------------------------------------------------------------
# Validações de formato (nullifica campo, não remove linha)
# ---------------------------------------------------------------------------


def apply_format_validations(
    df: pd.DataFrame,
    validations: list[dict],
    table: str,
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
            email_values = df[col].astype("string").str.strip()
            invalid_mask = not_null & ~email_values.str.fullmatch(_EMAIL_RE)
            df.loc[not_null, col] = email_values[not_null]

        elif vtype == "cpf_cnpj":
            normalized = df[col].apply(
                lambda val: _normalize_cpf_cnpj(str(val)) if pd.notna(val) else None
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

        count = int(invalid_mask.sum())
        if count:
            df.loc[invalid_mask, col] = pd.NA
            logger.warning(
                f"[{table}] format_validation: {count} valor(es) inválido(s) em '{col}' → NA"
            )
        nullified[col] = count

    return df, nullified


# ---------------------------------------------------------------------------
# Sinalizações cross-table (adiciona flag, não remove linha — Princípio 3)
# ---------------------------------------------------------------------------


def apply_cross_table_flags(
    df: pd.DataFrame,
    flags: list[dict],
    silver_cache: dict[str, pd.DataFrame],
    table: str,
) -> pd.DataFrame:
    """Adiciona colunas flag booleanas baseadas em join com outra tabela Silver.

    A flag é True quando a condição de inconsistência é detectada.
    Nunca remove linhas — a resolução final ocorre na Gold (Princípio 3).

    Formato esperado de cada flag no config:
        {
            "flag_col": "fl_sem_pgto",   # nome da coluna flag a criar
            "condition": "cd_status == 'PAGO'",  # condição para ativar o check
            "ref_table": "pagamentos",   # output_name da tabela Silver de referência
            "ref_key": "nr_ov",          # coluna-chave na tabela de referência
            "self_key": "nr_ov"          # coluna-chave nesta tabela
        }
    A flag será True quando: a condição é satisfeita E a chave NÃO existe na ref_table.
    """
    for flag in flags:
        flag_col = flag.get("flag_col")
        condition = flag.get("condition")
        ref_table = flag.get("ref_table")
        ref_key = flag.get("ref_key")
        self_key = flag.get("self_key")

        if not all([flag_col, ref_table, ref_key, self_key]):
            logger.warning(
                f"[{table}] cross_table_flag: configuração incompleta {flag} - flag=False"
            )
            df[flag_col or "flag_unknown"] = False
            continue

        if ref_table not in silver_cache:
            logger.warning(
                f"[{table}] cross_table_flag '{flag_col}': tabela '{ref_table}' "
                f"não encontrada no cache - flag=False"
            )
            df[flag_col] = False
            continue

        ref_df = silver_cache[ref_table]

        if ref_key not in ref_df.columns or self_key not in df.columns:
            logger.warning(
                f"[{table}] cross_table_flag '{flag_col}': coluna '{ref_key}' ou "
                f"'{self_key}' não encontrada - flag=False"
            )
            df[flag_col] = False
            continue

        ref_keys = set(ref_df[ref_key].dropna().unique())

        # Máscara de linhas que satisfazem a condição (ex: cd_status == 'PAGO')
        if condition:
            try:
                condition_mask = df.eval(condition).fillna(False).astype(bool)
            except Exception as exc:
                logger.error(
                    f"[{table}] cross_table_flag '{flag_col}': erro ao avaliar "
                    f"condição '{condition}': {exc} → flag=False"
                )
                condition_mask = pd.Series(False, index=df.index)
        else:
            condition_mask = pd.Series(True, index=df.index)

        # Flag = True quando satisfaz condição E chave não existe na referência
        key_absent = ~df[self_key].isin(ref_keys)
        df[flag_col] = condition_mask & key_absent

        flagged_count = int(df[flag_col].sum())
        logger.info(
            f"[{table}] cross_table_flag '{flag_col}': {flagged_count} linha(s) True"
        )

    return df


# ---------------------------------------------------------------------------
# Casts a partir do schema da Bronze
# ---------------------------------------------------------------------------


def apply_schema_casts_from_bronze(
    df: pd.DataFrame,
    schema: dict[str, str],
    table: str,
    date_cols: list[str] | None = None,
) -> tuple[pd.DataFrame, dict[str, int]]:
    """Aplica cast no DataFrame com base no schema da Bronze.

    Colunas presentes em date_cols são ignoradas aqui — serão tratadas
    por apply_date_conversions com lógica de múltiplos formatos.
    Falhas de cast resultam em pd.NA, nunca em exceção (Princípio 4).
    """
    cast_failures: dict[str, int] = {}
    date_cols_set = set(date_cols or [])

    for col, glue_type in schema.items():
        if col not in df.columns:
            continue

        if col in date_cols_set:
            cast_failures[col] = 0
            continue

        original = df[col].replace("", pd.NA)
        original_not_null = original.notna()
        glue_type = glue_type.lower()

        try:
            if glue_type in ("bigint", "int", "smallint", "tinyint"):
                converted = pd.to_numeric(original, errors="coerce").astype("Int64")
            elif glue_type in ("double", "float", "decimal"):
                converted = pd.to_numeric(original, errors="coerce").astype("Float64")
            elif glue_type == "boolean":
                converted = original.map(
                    {"true": True, "false": False, "1": True, "0": False, True: True, False: False}
                )
            else:
                converted = original.astype(str).where(original_not_null, pd.NA)

            fail_count = int((original_not_null & converted.isna()).sum())
            cast_failures[col] = fail_count
            if fail_count:
                logger.warning(f"[{table}] cast '{col}' ({glue_type}): {fail_count} falha(s)")
            df[col] = converted

        except Exception as exc:
            # Falha de conversão não pode derrubar o lote nem propagar o valor
            # original: todo o campo fica nulo e a quantidade é registrada.
            fail_count = int(original_not_null.sum())
            logger.error(f"[{table}] cast '{col}' ({glue_type}): erro inesperado: {exc}")
            cast_failures[col] = fail_count
            df[col] = pd.Series(pd.NA, index=df.index, dtype="object")

    return df, cast_failures


# ---------------------------------------------------------------------------
# Aplicação de flags computadas
# ---------------------------------------------------------------------------


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
                f"[{table}] computed_flag '{flag_col}': erro ao avaliar '{expr}': {exc}"
                f" -> flag setada como False"
            )
            df[flag_col] = False
    return df
