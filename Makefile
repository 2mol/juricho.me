.PHONY: help css build build-draft
.DEFAULT_GOAL := help

## build the page
build: css
	zola build

## build the page
build-draft: css
	zola build --drafts --base-url ${DEPLOY_PRIME_URL}

## build tailwind css and minify
css:
	NODE_ENV=production npx postcss -o static/tailwind.css styles/tailwind.css

# -----------------------------------------------------------------------------

# coloured `make` help text, courtesy of
# https://gist.github.com/prwhite/8168133#gistcomment-2278355
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=18
## Show this help.
help:
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
