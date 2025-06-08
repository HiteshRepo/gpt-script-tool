.PHONY: default
default: help

.PHONY: help
help:
	@grep -E '^[a-z.A-Z0-9_-]+:.*?#@ .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?#@ "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: install-requirements
install-requirements: #@ Installs all required packages
	@ chmod +x ./scripts/install-requirements.sh
	@ ./scripts/install-requirements.sh

.PHONY: run-cli-demo
run-cli-demo: #@ runs cli demo using gptscript
	@gptscript cli-demo.gpt

.PHONY: ws-list-ops
ws-list-ops: #@ lists operation IDs of weather stack APIs in weatherstack.openapi.yaml
	@grep operationId weatherstack.openapi.yaml

.PHONY: run-api-demo
run-api-demo: #@ runs api demo using gptscript
	@gptscript weather-tool.gpt

.PHONY: run-local-files-demo
run-local-files-demo: #@ runs local files demo using gptscript
	@gptscript --workspace=./sample-data local-files.gpt

.PHONY: run-tweets-workflow
run-tweets-workflow: #@ runs tweets summarizer workflow using gptscript
	@gptscript tweets-workflow.gpt
