CABAL_VERSION := 3.14.2.0
STACK_VERSION := 3.3.1
HLS_VERSION   := 2.10.0.0

SHELL := /bin/bash

.PHONY: init-haskell-tools

init-haskell-tools:
	@command -v curl >/dev/null 2>&1 || { echo "Please install curl"; exit 1; }

	@if [ -e "../ghcup/Makefile" ]; then \
		cd ../ghcup/ && make; \
	else \
		make -f <(curl https://t-sasaki.net/hs-makefiles/0.1.0.0/utils/ghcup/Makefile); \
	fi

	@if [ ! -e "$$HOME/.ghcup/bin/cabal-$(CABAL_VERSION)" ]; then \
		echo "Installing cabal..."; \
		bash -c "source $$HOME/.ghcup/env && ghcup install cabal $(CABAL_VERSION)"; \
	else \
		echo "cabal-$(CABAL_VERSION) has already been installed."; \
	fi

	@if [ ! "$(ONLY_CABAL)" = "1" ]; then \
		if [ ! -e "$$HOME/.ghcup/bin/stack-$(STACK_VERSION)" ]; then \
			echo "Installing stack..."; \
			bash -c "source $$HOME/.ghcup/env && ghcup install stack $(STACK_VERSION)"; \
		else \
			echo "stack-$(STACK_VERSION) has already been installed."; \
		fi \
	fi

	@if [ ! "$(ONLY_CABAL)" = "1" ]; then \
		if ! ls "$$HOME/.ghcup/bin"/"haskell-language-server"*"~$(HLS_VERSION)" 1>/dev/null 2>&1; then \
			echo "Installing haskell-language-server..."; \
			bash -c "source $$HOME/.ghcup/env && ghcup install hls $(HLS_VERSION)"; \
		else \
			echo "haskell-language-server-$(HLS_VERSION) has already been installed."; \
		fi \
	fi

	@echo ""
	@echo "INIT-HASKELL-TOOLS SUCCESSFUL."
	@echo "Please run 'source $$HOME/.bashrc'."
	@echo ""
