# Build from repo root:  docker build -f apps/web/Dockerfile .
FROM node:22-alpine
RUN corepack enable
WORKDIR /app
COPY package.json pnpm-workspace.yaml ./
COPY packages/contracts packages/contracts
COPY packages/ts-common packages/ts-common
COPY apps/web apps/web
RUN pnpm install --filter @homeflow/web... && pnpm --filter @homeflow/web build
EXPOSE 3000
CMD ["pnpm", "--filter", "@homeflow/web", "start"]
