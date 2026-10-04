"""POST /files: store raw file, record row in DB, publish `file.uploaded`.
GET /files/{id}: return processing status."""
from fastapi import APIRouter

router = APIRouter()
