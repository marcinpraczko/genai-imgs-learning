# ============================================================================
# Self-documenting Makefile based on https://gist.github.com/prwhite/8168133
# ============================================================================

UV ?= uv
PYTHON ?= python3
UV_VERSION ?=
UV_RUN := $(UV) run --frozen

##
## General
##

help: ## Show this help text
	@awk ' \
		match($$0, "^([^#]*[^ :]) *:([^#]*)##(.*)$$", a) { \
			printf "  make %-28s %s\n", a[1], a[3] \
		}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

##
## Development (uv)
##

.PHONY: uv-install
uv-install: ## Install uv via pip if missing (optionally pin UV_VERSION=x.y.z)
	@command -v $(UV) >/dev/null 2>&1 || \
		$(PYTHON) -m pip install --no-cache-dir --disable-pip-version-check "uv$(if $(UV_VERSION),==$(UV_VERSION),)"

.PHONY: uv-sync
uv-sync: uv-install ## Create .venv (if missing) and install locked dependencies
	$(UV) sync --frozen --no-dev

.PHONY: uv-sync-dev
uv-sync-dev: uv-install ## Same as uv-sync, including development tools (flake8)
	$(UV) sync --frozen

.PHONY: uv-lock
uv-lock: uv-install ## Re-resolve dependencies and update uv.lock
	$(UV) lock

.PHONY: uv-upgrade
uv-upgrade: uv-install ## Upgrade all locked dependencies within pyproject.toml constraints
	$(UV) lock --upgrade

.PHONY: run-validation
run-validation: uv-sync-dev ## Run flake8 validation
	$(UV_RUN) flake8 . --exclude=.venv,website,docs,public \
		--count --select=E9,F63,F7,F82 \
		--show-source --statistics
	$(UV_RUN) flake8 . --exclude=.venv,website,docs,public \
		--count --exit-zero --max-complexity=10 \
		--max-line-length=127 --statistics

##
## Website
##

.PHONY: build-website
build-website: uv-sync ## Build the Sphinx website into website/build/html
	$(MAKE) -C website SPHINXBUILD="$(UV_RUN) --no-sync sphinx-build" html

.PHONY: build-pages
build-pages: build-website ## Build the website and copy it to public/ (GitLab Pages artifact)
	rm -rf public
	mkdir -p public
	cp -a website/build/html/. public/
	du -chs public/

.PHONY: clean-website
clean-website: ## Remove generated Sphinx output
	rm -rf website/build public
