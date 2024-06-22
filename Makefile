up:
	docker compose up -d
	sleep 1
	PGPASSWORD='example' psql -U postgres -h localhost -p 5433

down:
	docker compose down

psql:
	PGPASSWORD='example' psql -U postgres -h localhost -p 5433