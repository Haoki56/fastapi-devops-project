up:
	docker compose up -d

down:
	docker compose down

build:
	docker compose build 

restart:
	docker compose down
	docker compose up -d 

ps:
	docker ps 

logs:
	docker compose logs 

health:
	curl -d http://localhost:8000/health 

check:
	docker compose config
      - name: Check Makefile exists
        run: test -f Makefile
