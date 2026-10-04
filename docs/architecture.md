# Architecture

| Unit                | Kind            | Deploys as             | Depends on (shared)              |
|---------------------|-----------------|------------------------|----------------------------------|
| apps/web            | UX              | container / static     | ts-common, contracts             |
| apps/api            | API             | container (HTTP)       | py-common, contracts             |
| services/intake     | worker          | container (queue)      | py-common, contracts             |
| services/processor  | worker          | container (queue)      | py-common, contracts             |
| services/chat       | internal API    | container (HTTP)       | py-common, contracts             |
| db                  | migrations      | one-off job            | —                                |

Rules:
1. Deployables never import each other — they talk via the REST contract or queue events.
2. Any cross-unit shape lives in `packages/contracts` first.
3. Only `db/migrations` changes the schema.
