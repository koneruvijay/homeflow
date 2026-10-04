# HomeFlow

Monorepo for the HomeFlow web app: a UX layer, an API layer, a database, an
async document-processing pipeline that builds a RAG knowledge base, and a
chatbot that searches it.

Shared contracts live in one place (`packages/contracts`); every deployable unit
lives in its own package with its own manifest, Dockerfile and CI workflow, so
each can be built, versioned and deployed independently.

## Layout

```
.
├── apps/                        # user-facing deployables
│   ├── web/                     # UX layer (Next.js) – upload UI + chatbot UI
│   └── api/                     # API layer (FastAPI) – auth, uploads, chat endpoint
├── services/                    # backend deployables
│   ├── intake/                  # LangChain file validation + classification
│   ├── processor/               # async worker: convert → redact → chunk → embed/store
│   └── chat/                    # RAG retrieval + answer generation for the chatbot
├── packages/                    # shared libraries (not deployed on their own)
│   ├── contracts/               # source-of-truth schemas: REST (OpenAPI) + events (JSON Schema)
│   ├── py-common/               # shared Python: config, logging, queue, storage clients
│   └── ts-common/               # shared TypeScript: API client, generated types
├── db/                          # database: migrations + seeds (deployed as a migration job)
├── infra/                       # docker-compose, Kubernetes, Terraform
├── docs/                        # architecture + ADRs
└── .github/workflows/           # one CI workflow per deployable, path-filtered
```

## Data flow

```
web ──► api ──► object storage (raw)
              └► queue: file.uploaded
                    │
                 intake (LangChain validate + classify)
                    └► queue: file.classified
                          │
                       processor
                         convert → redact PII → chunk → embed → vector store
                          └► queue: document.indexed
                                         │
web (chatbot) ──► api ──► chat ──► vector store (retrieve) ──► LLM ──► answer
```

## Tooling

| Language   | Workspace tool | Members                                              |
|------------|----------------|------------------------------------------------------|
| TypeScript | pnpm           | `apps/web`, `packages/ts-common`, `packages/contracts` |
| Python     | uv             | `apps/api`, `services/*`, `packages/py-common`        |

## Quick start

```bash
cp .env.example .env
make bootstrap      # install pnpm + uv workspaces
make up             # docker compose: postgres, redis, minio, all services
```

## Deploying a single unit

Each package has its own `Dockerfile` (built from the repo root so it can pull in
shared packages) and its own CI workflow under `.github/workflows/`, triggered
only when that package or a package it depends on changes.

```bash
docker build -f services/processor/Dockerfile -t homeflow/processor .
```
