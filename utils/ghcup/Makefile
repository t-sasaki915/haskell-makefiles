SHELL := /bin/bash

.PHONY: init-ghcup

init-ghcup:
	@command -v curl >/dev/null 2>&1 || { echo "Please install curl"; exit 1; }

	@if [ ! -d "$$HOME/.ghcup" ]; then \
		echo "Installing GHCup..."; \
		\
		export BOOTSTRAP_HASKELL_NONINTERACTIVE=1; \
		export BOOTSTRAP_HASKELL_MINIMAL=1; \
		export BOOTSTRAP_HASKELL_ADJUST_BASHRC=1; \
		curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh; \
	else \
		echo "Makefile found $$HOME/.ghcup directory. Skipping GHCup installation."; \
	fi

	@echo ""
	@echo "INIT-GHCUP SUCCESSFUL."
	@echo "Please run 'source $$HOME/.bashrc'."
	@echo ""
