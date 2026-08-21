"""Configurações por ambiente do projeto Vende+ Data Platform."""

import os


CONFIGS = {
    "dev": {
        "pasta_input": "/opt/airflow/data/input",
        "pasta_output": "/opt/airflow/data/output",
        "pasta_cotacao_raw": "/opt/airflow/data/cotacao/raw",
        "pasta_cotacao_consolidated": "/opt/airflow/data/cotacao/consolidated",
        "url_cotacao": "https://economia.awesomeapi.com.br/last/USD-BRL",
        "email_alerta": "dados@vendemais.com.br",
    },
    "prod": {
        "pasta_input": "/data/vendemais/input",
        "pasta_output": "/data/vendemais/output",
        "pasta_cotacao_raw": "/data/vendemais/cotacao/raw",
        "pasta_cotacao_consolidated": "/data/vendemais/cotacao/consolidated",
        "url_cotacao": "https://economia.awesomeapi.com.br/last/USD-BRL",
        "email_alerta": "dados@vendemais.com.br",
    },
}


def get_config() -> dict:
    """Retorna o conjunto de configurações do ambiente ativo.

    Lê a variável de ambiente `ENV` (padrão: dev).
    """
    env = os.getenv("ENV", "dev")
    if env not in CONFIGS:
        raise ValueError(f"Ambiente desconhecido: {env}")
    return CONFIGS[env]
