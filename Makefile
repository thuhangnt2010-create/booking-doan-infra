.PHONY: dev health down logs reload-nginx

dev:
	docker compose up -d --build
# Nginx has no `build:` step and uses a bind-mounted nginx.conf. `git pull` replaces
# the file (new inode), so the running container keeps the OLD content until it is
# recreated. Run `make reload-nginx` after any nginx.conf change.

reload-nginx:
	docker compose up -d --force-recreate nginx

health:
	curl -sf http://localhost/api/health && echo "\nOK"

down:
	docker compose down

logs:
	docker compose logs -f
