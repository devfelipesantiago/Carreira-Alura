"""
Constantes compartilhadas entre os módulos da Lambda Silver.
Sem dependências AWS.
"""

import json
import operator
import re
from pathlib import Path
_CONFIG_PATH = Path(__file__).with_name("table_config.json")


def _load_table_config() -> dict:
    "Carrega a configuração declarativa única usada pelo Lambda Silver."
    with _CONFIG_PATH.open(encoding="utf-8") as config_file:
        return json.load(config_file)

_RAW_CONFIG = _load_table_config()
TABLE_CONFIG = _RAW_CONFIG["table_configs"]
PROCESSING_ORDER = _RAW_CONFIG.get("processing_order", list(TABLE_CONFIG))

# A configuração acima é o contrato do pipeline; não há lógica específica por tabela.

# ------------------------------------------------------------------------------------
# Operadores para validity_filters
# ------------------------------------------------------------------------------------


_OPS = {
    ">": operator.gt,
    ">=": operator.ge,
    "<": operator.lt,
    "<=": operator.le,
    "==": operator.eq,
    "!=": operator.ne,
}


# ------------------------------------------------------------------------------------
# Formatos de data a tentar (em ordem)
# ------------------------------------------------------------------------------------
DATE_FORMATS = ["%Y-%m-%d", "%d/%m/%Y", "%d-%m-%Y", "%Y%m%d"]


# ------------------------------------------------------------------------------------
# Regex de e-mail (RFC 5322 simplificado)
# ------------------------------------------------------------------------------------
_EMAIL_RE = re.compile(r"([^@|\s]+@[^@]+\.[^@|\s]+)")
