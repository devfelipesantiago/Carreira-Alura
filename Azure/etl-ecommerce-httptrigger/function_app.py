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


@app.route(route="process-ecommerce-logs", methods=["POST"])
def http_trigger_ecommerce_logs(req: func.HttpRequest) -> func.HttpResponse:
    try:
        body = req.get_json()
        folder_path = body.get("folderPath")
        file_name = body.get("fileName")

        if not folder_path or not file_name:
            return func.HttpResponse(
                json.dumps({
                    "error": "folderPath e fileName são obrigatórios"
                    }),
                status_code=400,
                mimetype="application/json",
            )

        blob_path = f"bronze/{folder_path}/{file_name}"
        logging.info(f"HTTP trigger chamado para: {blob_path}")

        client = BlobServiceClient.from_connection_string(STORAGE_CONN)
        blob = client.get_blob_client(
            container="bronze", blob=f"{folder_path}/{file_name}"
        )
        content = blob.download_blob().readall().decode("utf-8")
        records = [json.loads(line) for line in content.split("\n") if line]

        transformed = transform_records(records)
        df = to_dataframe(transformed)
        silver_path = build_silver_path(blob_path)
        save_parquet(df, silver_path)

        return func.HttpResponse(
            json.dumps(
                {
                    "status": "sucesso",
                    "parquet": blob_path,
                    "silver_path": silver_path,
                    "total_registros": len(df),
                }
            ),
            status_code=200,
            mimetype="application/json",
        )

    except Exception as e:
        logging.error(f"Erro ao processar: {str(e)}")
        return func.HttpResponse(
            json.dumps({"error": str(e)}),
            status_code=500,
            mimetype="application/json",
        )


def transform_records(records: list) -> list:
    transformed = []
    for record in records:
        if not record.get("user_id"):
            continue
        if not record.get("device"):
            record["device"] = "unknown"
        price = record.get("price")
        if price is not None:
            try:
                record["price"] = float(str(price).replace(",", "."))
            except (ValueError, TypeError):
                record["price"] = None
        transformed.append(record)
    return transformed


def to_dataframe(records: list) -> pd.DataFrame:
    df = pd.DataFrame(records)
    df["price"] = pd.to_numeric(df["price"], errors="coerce")
    df["timestamp"] = pd.to_datetime(df["timestamp"], errors="coerce")
    return df


def build_silver_path(bronze_path: str) -> str:
    parts = bronze_path.replace("bronze/", "").split("/")
    return "/".join(parts[0:3]) + "/" + parts[3].replace(".json", "")


def save_parquet(df: pd.DataFrame, silver_path: str) -> None:
    buffer = BytesIO()
    df.to_parquet(buffer, index=False, engine="pyarrow")
    buffer.seek(0)
    client = BlobServiceClient.from_connection_string(STORAGE_CONN)
    blob = client.get_blob_client(
        container=SILVER_CONTAINER, blob=f"{silver_path}/data.parquet"
    )
    blob.upload_blob(buffer, overwrite=True)
