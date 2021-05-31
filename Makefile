all: build up ps
reset: down prune build up ps

prune:
	docker system prune -f
build:
	docker-compose build
up:
	docker-compose up -d
ps:
	docker-compose ps
down:
	docker-compose down -v
logs:
	docker-compose logs -f

login:
	docker-compose exec app /bin/bash
erd:
	docker-compose exec app bundle exec erd

