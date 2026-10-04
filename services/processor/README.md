# services/processor — async processing pipeline

Consumes `file.classified` and runs:

1. `convert` – file conversion to normalized text
2. `redact` – sensitive-data (PII) removal
3. `chunk` – chunking
4. `embed_store` – embedding + RAG vector-store write

Publishes `document.indexed` when done.
