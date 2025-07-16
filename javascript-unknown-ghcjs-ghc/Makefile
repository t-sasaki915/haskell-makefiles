CABAL_VERSION := 3.14.2.0
GHC_VERSION   := 9.12.2
EMSDK_VERSION := 3.1.74

SHELL := /bin/bash

.PHONY: init-ghc

init-ghc:
	@command -v curl >/dev/null 2>&1 || { echo "Please install curl"; exit 1; }
	@command -v git >/dev/null 2>&1 || { echo "Please install git"; exit 1; }

	@if [ -e "$$HOME/.ghcup/bin/javascript-unknown-ghcjs-ghc-$(GHC_VERSION)" ]; then \
		echo "javascript-unknown-ghcjs-ghc-$(GHC_VERSION) has already been installed."; \
		exit 1; \
	fi
	
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

	@if [ ! -d "$$HOME/.emsdk" ]; then \
		echo "Installing emsdk..."; \
		\
		git clone https://github.com/emscripten-core/emsdk.git $$HOME/.emsdk; \
	else \
		echo "Makefile found $$HOME/.emsdk directory. Skipping emsdk installation."; \
	fi

	bash -c "source $$HOME/.ghcup/env && ghcup install cabal $(CABAL_VERSION)"

	@echo "Installing javascript-unknown-ghcjs-ghc..."

	$$HOME/.emsdk/emsdk install $(EMSDK_VERSION)
	$$HOME/.emsdk/emsdk activate $(EMSDK_VERSION)

	bash -c "source $$HOME/.ghcup/env && ghcup config add-release-channel cross"
	bash -c "source $$HOME/.ghcup/env && source $$HOME/.emsdk/emsdk_env.sh && emconfigure ghcup install ghc --set javascript-unknown-ghcjs-$(GHC_VERSION)"

	@echo ""
	@echo "INIT-HASKELL SUCCESSFUL."
	@echo "Please run 'source $$HOME/.bashrc'."
	@echo ""
