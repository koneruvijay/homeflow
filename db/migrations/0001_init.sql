CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE files (
  id           UUID PRIMARY KEY,
  storage_key  TEXT NOT NULL,
  mime_type    TEXT NOT NULL,
  size_bytes   BIGINT,
  status       TEXT NOT NULL DEFAULT 'uploaded',
  category     TEXT,
  uploaded_by  TEXT NOT NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE chunks (
  id         UUID PRIMARY KEY,
  file_id    UUID NOT NULL REFERENCES files(id) ON DELETE CASCADE,
  ordinal    INT NOT NULL,
  content    TEXT NOT NULL,
  metadata   JSONB NOT NULL DEFAULT '{}',
  embedding  VECTOR(1024)
);
