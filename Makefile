.PHONY: default
default: help

.PHONY: help
help:
	@grep -E '^[a-z.A-Z0-9_-]+:.*?#@ .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?#@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: install-requirements
install-requirements: #@ Installs all required packages
	@ chmod +x ./scripts/install-requirements.sh
	@ ./scripts/install-requirements.sh

.PHONY: run-github-demo
run-github-demo: #@ runs github tool using gptscript
	@gptscript tools/github/github.gpt

.PHONY: ws-list-ops
ws-list-ops: #@ lists operation IDs of weather stack APIs in weatherstack.openapi.yaml
	@grep operationId tools/weather/weatherstack.openapi.yaml

.PHONY: run-api-demo
run-api-demo: #@ runs api demo using gptscript
	@gptscript tools/weather/weather-tool.gpt

.PHONY: run-local-files-demo
run-local-files-demo: #@ runs local files demo using gptscript
	@gptscript --workspace=./sample-data tools/data-processing/local-files.gpt

.PHONY: run-tweets-workflow
run-tweets-workflow: #@ runs tweets summarizer workflow using gptscript
	@gptscript tools/social/tweets-workflow.gpt

.PHONY: suggest-commands
suggest-commands: #@ analyze repo state and suggest relevant commands to run
	@gptscript tools/repo-analysis/repo-command-suggester.gpt

.PHONY: demo-suggest-commands
demo-suggest-commands: #@ demo the repo command suggester without requiring GPTScript
	@./tools/repo-analysis/demo.sh
