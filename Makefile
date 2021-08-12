DEFAULT_GOAL := help

# Prepare the extra command for different OS
OS_NAME := $(shell uname)
SED_EXTRA_COMMAND :=-i
# MARIADB_VOLUME :=\.\/database
MARIADB_VOLUME :=$${name:-default}-mariadb-volume
# MACOSX
ifeq ($(OS_NAME),Darwin) 
	SED_EXTRA_COMMAND :=-i ""
# LINUX
else ifeq ($(OS_NAME),Linux) 
	MIGRATE_EXTRA_COMMAND :=sleep 30s && 
# WINDOWS
else
	MIGRATE_EXTRA_COMMAND :=sleep 30s && 
	DOCKER_EXEC_EXTRA_COMMAND :=winpty 
	MARIADB_VOLUME :=$${name:-./default}-mariadb-volume
endif

# Help
help:
	@echo 'Usage: make [options] ...'
	@echo 'For PRODUCTION: add suffix _prod at the end of the options, example: init_prod, run_prod, down_prod, restart_prod'
	@echo 'Options:'
	@echo '  init        Init project, cp example config files'
	@echo '  run        Run the docker instance to be able to access locally.'
	@echo '             e.g. http://localhost:8088/'
	@echo '  down       Stop the running docker instance.'
	@echo '  restart     Restart Containers'
	@echo '             Down, Up Containers'
	@echo ''

# Init the instance
init:
	@cp .env.example .env
	@cp etc/nginx/default.conf.example etc/nginx/default.conf
	@cp etc/php/custom.ini.example etc/php/custom.ini
	@cp etc/php/www.conf.example etc/php/www.conf
	@cp docker-compose.yml.example docker-compose.yml
	@cp docker-compose.override.yml.example docker-compose.override.yml

# Init the instance
init_prod:
	@cp .env.example .env
	@cp etc/nginx/default.conf.example etc/nginx/default.conf
	@cp etc/php/custom.ini.example etc/php/custom.ini
	@cp etc/php/www.conf.example etc/php/www.conf
	@cp docker-compose.yml.example docker-compose.yml
	@cp docker-compose.prod.yml.example docker-compose.prod.yml

# Run the instance
run:
	@docker-compose up -d

# Run the instance
run_prod:
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build

# Down the Containers
down:
	@docker-compose down --remove-orphans

# Down the Containers
down_prod:
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml down --remove-orphans

# Restart Containers
restart:
	@docker-compose down --remove-orphans
	@docker-compose up -d
	@docker-compose ps

# Restart Containers
restart_prod:
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml down --remove-orphans
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
	@docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps
