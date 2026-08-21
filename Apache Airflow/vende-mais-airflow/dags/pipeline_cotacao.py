"""DAG de cotação USD-BRL — busca diária via AwesomeAPI e consolida histórico de 7 dias."""

from datetime import datetime, timedelta

from airflow.decorators import dag, task

import helpers.cotacao as cotacao_helper
from helpers.callbacks import notificar_falha

URL_API = "https://economia.awesomeapi.com.br/last/USD-BRL"
PASTA_RAW = "/opt/airflow/data/cotacao/raw"
CAMINHO_CONSOLIDADO = "/opt/airflow/data/cotacao/consolidated/historico_7dias.csv"


ARGS_PADRAO = {
    "retries": 1,
    "retry_delay": timedelta(minutes=1),
    "on_failure_callback": notificar_falha,
}


@dag(
    dag_id="pipeline_cotacao",
    description="Busca cotação USD-BRL e consolida histórico dos últimos 7 dias",
    start_date=datetime(2025, 1, 14),
    schedule=None,
    catchup=False,
    default_args=ARGS_PADRAO,
    tags=["cotacao", "financeiro"],
)
def pipeline_cotacao():

    @task()
    def buscar_e_salvar_cotacao():
        """Busca cotação na API e salva o JSON bruto na pasta raw."""
        cotacao = cotacao_helper.buscar_cotacao(URL_API)
        cotacao_helper.salvar_json_bruto(cotacao, PASTA_RAW)

    @task()
    def consolidar():
        """Lê os JSONs dos últimos 7 dias e gera o CSV consolidado."""
        cotacao_helper.consolidar_historico(PASTA_RAW, CAMINHO_CONSOLIDADO)

    buscar_e_salvar_cotacao() >> consolidar()


pipeline_cotacao()
