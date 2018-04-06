.PHONY: help install build start test connect paket-clear

USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

export UID = $(USER_ID)
export GID = $(GROUP_ID)

BIN = docker run -i -t --rm \
	--user "${UID}:${GID}" \
	-v "${PWD}:/app" \
	fsharp-invader

help: ## Display available commands
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	docker build --tag=fsharp-invader .
	$(MAKE) paket-setup

build: ## Build project
	$(BIN) bash -c "rm -rf /app/dist/*"
	$(BIN) bash -c "dotnet publish -r debian.8-x64 -o /app/dist"

start: ## Start project
	$(BIN) bash -c "dotnet run"

test: ## Test Project
	$(BIN) bash -c "echo 'MISSING TESTS'"

connect: ## Connect to container
	$(BIN) bash

paket-clear: ## Clean paket artifacts
	rm -rf paket.lock paket-files .paket/Paket.Restore.targets packages

paket-setup: ## Setup paket
	$(BIN) bash -c "mono .paket/paket.exe install"
