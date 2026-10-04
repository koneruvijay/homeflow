migrate:
	@for f in migrations/*.sql; do echo "applying $$f"; psql "$$DATABASE_URL" -f $$f; done
