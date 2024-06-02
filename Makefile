up:
	docker compose up -d
	sleep 2
	PGPASSWORD='example' psql -U postgres -h localhost -p 5433

down:
	docker compose down