#!make
ifneq (,$(wildcard ./.env))
	include .env
	NOW_DATE=$(shell date +'%y%m%d-%H%M')
	BACKUP_FULLNAME="${DATABASE_NAME}-${NOW_DATE}.sql"
endif


build:
	docker-compose build python3

build_anacoda:
	docker-compose build anacoda

bash:
	docker-compose exec -it python3 bash

shell:
	docker-compose run python3 bash 

