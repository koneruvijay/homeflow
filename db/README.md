# db — database

Postgres (with the `pgvector` extension for RAG storage). Migrations here are the
single source of truth for schema; they run as a one-off job before deploying
services that depend on a new schema.
