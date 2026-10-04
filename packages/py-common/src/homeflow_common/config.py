from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    database_url: str = ""
    redis_url: str = "redis://localhost:6379/0"
    s3_endpoint: str = ""
    s3_bucket_raw: str = "homeflow-raw"
    s3_bucket_processed: str = "homeflow-processed"
    vector_store_url: str = ""
