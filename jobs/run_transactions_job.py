import os
import json
from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket
from prefect_gcp import GcpCredentials
from prefect.blocks.system import Secret
from google.cloud import storage


@task(retries=3, tags=["extract"])
def extract_from_gcs(name_of_file: str, bucket_name: str) -> Path:
    """Extract Data from a Cloud Storage Bucket"""

    # Create a Storage client
    secret_block = Secret.load("gcp-creds").get()
    credentials = json.loads(secret_block)
    storage_client = storage.Client.from_service_account_info(credentials)
    # Read the CSV file from Cloud Storage
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(f"{name_of_file}.parquet")

    # Download the file to a destination
    blob.download_to_filename(f"{name_of_file}.parquet")
   
    local_path = f"{name_of_file}.parquet"

    if local_path is not None:
        return Path(local_path)


@task(tags=["transform"])
def transform(path: Path) -> pd.DataFrame:
    """Data Transformation"""

    df = pd.read_parquet(path)
    print(f"Total no of rows: {len(df)}")
    return df


@task(tags=["load to bq"])
def write_bq(df: pd.DataFrame, gcp_project_id: str, destination_table: str) -> None:
    """Write DataFrame to BiqQuery"""

    gcp_credentials_block = GcpCredentials.load("zoom")

    df.to_gbq(
        destination_table=destination_table,
        project_id=gcp_project_id,
        credentials=gcp_credentials_block.get_credentials_from_service_account(),
        chunksize=500_000,
        if_exists="append",
    )


@flow()
def etl_gcs_to_bq(name_of_file, bucket_name, gcp_project_id, destination_table):
    """Main ETL flow to load data into Big Query"""

    path = extract_from_gcs(name_of_file, bucket_name)
    df = transform(path)
    write_bq(df, gcp_project_id, destination_table)
