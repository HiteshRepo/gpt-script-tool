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
