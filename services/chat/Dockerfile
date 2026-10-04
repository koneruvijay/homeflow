# Build from repo root:  docker build -f services/chat/Dockerfile .
FROM python:3.12-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv
WORKDIR /app
COPY packages/py-common packages/py-common
COPY services/chat services/chat
RUN uv pip install --system ./packages/py-common ./services/chat
CMD ["uvicorn", "homeflow_chat.main:app", "--host", "0.0.0.0", "--port", "8100"]
