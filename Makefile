.PHONY: bootstrap up down test lint contracts migrate

# Container engine; override with `make up ENGINE=docker`
ENGINE ?= podman
COMPOSE_FILE := infra/podman/compose.yaml

bootstrap:
	pnpm install
	uv sync --all-packages

up:
	$(ENGINE) compose -f $(COMPOSE_FILE) --env-file .env up --build

down:
	$(ENGINE) compose -f $(COMPOSE_FILE) down

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
