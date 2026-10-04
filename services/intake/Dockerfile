# Build from repo root:  docker build -f services/intake/Dockerfile .
FROM python:3.12-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
WORKDIR /app
COPY packages/py-common packages/py-common
COPY services/intake services/intake
RUN uv pip install --system ./packages/py-common ./services/intake
CMD ["python", "-m", "homeflow_intake.worker"]
