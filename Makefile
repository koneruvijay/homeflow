.PHONY: bootstrap up down test lint contracts migrate

bootstrap:
	pnpm install
	uv sync --all-packages

up:
	docker compose -f infra/docker/docker-compose.yml --env-file .env up --build

down:
	docker compose -f infra/docker/docker-compose.yml down

test:
	pnpm test
	uv run --all-packages pytest

lint:
	pnpm lint
	uv run ruff check .

contracts:
	pnpm contracts:gen

migrate:
	$(MAKE) -C db migrate
