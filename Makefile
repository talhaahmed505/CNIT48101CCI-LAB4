COMPOSE := docker compose
PROD    := --profile prod
DEV     := --profile dev
OBS     := --profile obs

.PHONY: up dev prod obs down logs clean

up:
	$(COMPOSE) $(PROD) $(DEV) $(OBS) up --build -d

dev:
	$(COMPOSE) $(PROD) $(DEV) up --build -d

prod:
	$(COMPOSE) $(PROD) up --build -d

obs:
	$(COMPOSE) $(PROD) $(OBS) up --build -d

down:
	$(COMPOSE) $(PROD) $(DEV) $(OBS) down

logs:
	$(COMPOSE) $(PROD) $(DEV) $(OBS) logs -f --tail=100

clean:
	$(COMPOSE) $(PROD) $(DEV) $(OBS) down -v --remove-orphans
	rm -rf docs/build