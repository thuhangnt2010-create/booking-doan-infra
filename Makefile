.PHONY: dev health down logs

dev:
	docker compose up -d --build

health:
	curl -sf http://localhost/api/health && echo "\nOK"

down:
	docker compose down

logs:
	docker compose logs -f
