from fastapi import FastAPI

app = FastAPI(title="HomeFlow Chat")


@app.get("/healthz")
def healthz() -> dict:
    return {"status": "ok"}
