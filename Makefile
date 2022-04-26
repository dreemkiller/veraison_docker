
USER ?= $(shell id -un)
UID ?= $(shell id -u)
VERAISON_HOME ?= "../veraison"
.PHONY:
build:
	docker build --build-arg USER=$(USER) --build-arg UID=$(UID) -t veraison/latest .

.PHONY:
run: build
	docker run --name veraison_$(USER) -v $(VERAISON_HOME):/work/veraison --detach veraison/latest

.PHONY:
exec: run
	docker exec -u $(USER) -it veraison_$(USER) /bin/bash || true