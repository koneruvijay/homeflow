from fastapi import FastAPI

from homeflow_api.routes import chat, files, health

app = FastAPI(title="HomeFlow API")
app.include_router(health.router)
app.include_router(files.router, prefix="/files", tags=["files"])
app.include_router(chat.router, prefix="/chat", tags=["chat"])
