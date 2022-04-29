
USER ?= $(shell id -un)
UID ?= $(shell id -u)
VERAISON_HOME ?= "../veraison"
.PHONY:
build: Makefile Dockerfile
	docker build --build-arg USER=$(USER) --build-arg UID=$(UID) -t veraison/latest .
	touch .veraison_docker_build

.PHONY:
run: .veraison_docker_build
	docker run --name veraison_$(USER) -v $(abspath $(VERAISON_HOME)):/work/veraison --detach veraison/latest
	touch .veraison_docker_run

.PHONY:
exec: .veraison_docker_run
	docker exec -u $(USER) -it veraison_$(USER) /bin/bash || true
