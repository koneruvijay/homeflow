# @homeflow/contracts

Single source of truth for every interface between deployables.

- `openapi/` – REST API exposed by `apps/api` (consumed by `apps/web`).
- `events/`  – JSON Schemas for queue messages between pipeline stages.
- `generated/` – code generated from the schemas (do not edit by hand):
  - `ts/` → consumed by `apps/web` via `@homeflow/ts-common`
  - `python/` → consumed by Python services via `homeflow-common`

Run `pnpm contracts:gen` after changing a schema.
