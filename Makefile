.SILENT:
.PHONY:

APP_NAME = myapp
DIRS = $(shell find projects/ -maxdepth 1 -mindepth 1 -type d)
ARGS = $(filter-out $@,$(MAKECMDGOALS))

define recurse =
	for dir in $(DIRS); do \
		$(MAKE) $@ -C $$dir ARGS=$(ARGS); \
	done
endef

%:
	$(recurse)
	@:

init: submodules resources update up

submodules:
	git submodule init
	git submodule update --remote --merge

resources:
	docker network create $(APP_NAME)
	docker volume create --name $(APP_NAME)

update:
	docker-compose down
	docker-compose pull
	docker-compose build
	$(recurse)


up:
	docker-compose up -d
	$(recurse)

down:
	docker-compose down
	$(recurse)
