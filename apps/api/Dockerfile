# Build from repo root:  docker build -f apps/api/Dockerfile .
FROM python:3.12-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
WORKDIR /app
COPY packages/py-common packages/py-common
COPY apps/api apps/api
RUN uv pip install --system ./packages/py-common ./apps/api
CMD ["uvicorn", "homeflow_api.main:app", "--host", "0.0.0.0", "--port", "8000"]
