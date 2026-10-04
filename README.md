# HomeFlow

Monorepo for the HomeFlow web app: a UX layer, an API layer, a database, an
async document-processing pipeline that builds a RAG knowledge base, and a
chatbot that searches it.

Shared contracts live in one place (`packages/contracts`); every deployable unit
lives in its own package with its own manifest, so each can be built, versioned
and deployed independently.

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
├── db/                          # database: migrations + seeds
└── docs/                        # architecture + ADRs
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
pnpm install            # TypeScript workspace
uv sync --all-packages  # Python workspace
```

Container builds, CI and infrastructure (compose, Kubernetes, Terraform) will be
added later.
