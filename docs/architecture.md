# Architecture

| Unit                | Kind            | Runs as                | Depends on (shared)              |
|---------------------|-----------------|------------------------|----------------------------------|
| apps/web            | UX              | web app                | ts-common, contracts             |
| apps/api            | API             | HTTP service           | py-common, contracts             |
| services/intake     | worker          | queue worker           | py-common, contracts             |
| services/processor  | worker          | queue worker           | py-common, contracts             |
| services/chat       | internal API    | HTTP service           | py-common, contracts             |
| db                  | migrations      | one-off job            | —                                |

Rules:
1. Deployables never import each other — they talk via the REST contract or queue events.
2. Any cross-unit shape lives in `packages/contracts` first.
3. Only `db/migrations` changes the schema.
