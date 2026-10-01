import azure.functions as func
import logging
import pandas as pd
import json
from io import BytesIO
from azure.storage.blob import BlobServiceClient
import os

app = func.FunctionApp()

STORAGE_CONN = os.environ.get("stpipelinedatalake0926_STORAGE")
SILVER_CONTAINER = "silver"


@app.blob_trigger(
    arg_name="myblob",
    path="bronze/{ano}/{mes}/{dia}/{name}.json",
    connection="stpipelinedatalake0926_STORAGE",
)
def processar_logs_ecommerce(myblob: func.InputStream):
    logging.info(f"Processando arquivo: {myblob.name}")
    logging.info(f"Tamanho do arquivo: {myblob.length} bytes")

    # Ler o conteúdo JSON do Blob
    conteudo = myblob.read().decode("utf-8")
    dados = json.loads(conteudo)
    dados = transform_records(dados)

    # Contar e exibir a quantidade de registros
    total_registros = len(dados) if isinstance(dados, list) else 1
    logging.info(f"Quantidade de registros encontrados: {total_registros}")

    transformed = transform_records(dados)

    df = to_dataframe(transformed)
    silver_path = build_silver_path(myblob.name)
    save_parquet(df, silver_path)
    logging.info(f"Parquet salvo em: {silver_path}")


def transform_records(records: list[dict]) -> list[dict]:
    transformed = []

    for record in records:
        user_id = record.get("user_id")
        device = record.get("device")
        price = record.get("price")

        # Remove registros sem user_id
        if not user_id:
            logging.warning(f"Registro removido por falta de user_id: {record}")
            continue

        # Preenche device nulo com "unknown"
        if not device:
            logging.info(f"[device] '{device}' -> 'unknown' | user: {user_id}")
            record["device"] = "unknown"

        # Converte price para float, valor inválido vira 0.0
        try:
            clean_price = str(price).replace(",",".")
            record["price"] = float(clean_price)
        except (ValueError, TypeError):
            logging.warning(f"[price] '{price}' inválido -> 0.0 | user: {user_id}")
            record["price"] = 0.0

        logging.info(f"Registro transformado: {record}")
        transformed.append(record)

    logging.info(f"Total após transformação: {len(transformed)} registros")
    return transformed


def to_dataframe(records: list) -> pd.DataFrame:
    """Converte a lista de dicionários em DataFrame com tipos corretos."""
    df = pd.DataFrame(records)

    # Garante que price é numérico (erros viram NaN)
    df["price"] = pd.to_numeric(df["price"], errors="coerce")

    # Converte timestamp para datetime, ignorando formatos inválidos
    df["timestamp"] = pd.to_datetime(df["timestamp"], errors="coerce")

    return df


def build_silver_path(bronze_path: str) -> str:
    """
    Deriva o caminho silver a partir do caminho bronze.
    bronze:{year}/{month}/{day}/{name}.json
    + silver:/{year}/{month}/{day}/{name}.parquet
    """
    parts = bronze_path.replace("bronze/", "").rsplit("/", 1)
    return f"{SILVER_CONTAINER}/{parts[0]}/{parts[1]}.parquet"


def save_parquet(df: pd.DataFrame, silver_path: str) -> None:
    # Salva o DataFrame como arquivo Parquet no Azure Blob Storage
    buffer = BytesIO()
    # Salva o DataFrame como Parquet no buffer
    df.to_parquet(buffer, index=False, engine="pyarrow")
    # Move o cursor do buffer para o início antes de fazer upload
    buffer.seek(0)

    # Conecta ao Azure Blob Storage e faz o upload do arquivo Parquet
    client = BlobServiceClient.from_connection_string(STORAGE_CONN)
    blob_client = client.get_blob_client(container=SILVER_CONTAINER,
                                         blob=silver_path
                                         .removeprefix(f"{SILVER_CONTAINER}/"))
    blob_client.upload_blob(buffer, overwrite=True)
