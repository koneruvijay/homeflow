# apps/api — API layer

FastAPI service exposing the REST contract in `packages/contracts/openapi/api.yaml`.

- Auth + session handling
- File upload → object storage → publish `file.uploaded`
- File status lookups from Postgres
- `/chat` proxy to `services/chat`

Run locally: `uv run --package homeflow-api uvicorn homeflow_api.main:app --reload`
