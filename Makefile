
USER ?= $(shell id -un)
UID ?= $(shell id -u)
VERAISON_HOME ?= "../services"
.PHONY:
build: .veraison_docker_build
.veraison_docker_build: Makefile Dockerfile
	docker build --build-arg USER=$(USER) --build-arg UID=$(UID) -t veraison/latest .
	touch .veraison_docker_build

.PHONY:
run: .veraison_docker_run
.veraison_docker_run: .veraison_docker_build
	docker run --name veraison_strawman_$(USER) -v $(abspath $(VERAISON_HOME)):/work/services --detach veraison/latest
	#docker run -p 8080:8080 -p 8888:8888 --name veraison_$(USER) -v $(abspath $(VERAISON_HOME)):/work/veraison --detach veraison/latest
	touch .veraison_docker_run

.PHONY:
exec: .veraison_docker_run
	docker exec -u $(USER) -it veraison_$(USER) /bin/bash || true
