CABAL_VERSION := 3.14.2.0
GHC_VERSION   := 9.12.2
EMSDK_VERSION := 3.1.74

SHELL := /bin/bash

.PHONY: init-ghc

init-ghc:
	@command -v curl >/dev/null 2>&1 || { echo "Please install curl"; exit 1; }
	@command -v git >/dev/null 2>&1 || { echo "Please install git"; exit 1; }

	@command -v javascript-unknown-ghcjs-ghc-$(GHC_VERSION) >/dev/null 2>&1 && { \
		echo "javascript-unknown-ghcjs-ghc-$(GHC_VERSION) has already been installed."; \
		exit 0; \
	}
	
	@if [ ! -d "$$HOME/.ghcup" ]; then \
		echo "Installing GHCup..."; \
		\
		export BOOTSTRAP_HASKELL_NONINTERACTIVE=1; \
		export BOOTSTRAP_HASKELL_MINIMAL=1; \
		export BOOTSTRAP_HASKELL_ADJUST_BASHRC=1; \
		curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh; \
	else \
		echo "Makefile found ~/.ghcup directory. Skipping GHCup installation."; \
	fi

	@if [ ! -d "$$HOME/.emsdk" ]; then \
		echo "Installing emsdk..."; \
		\
		git clone https://github.com/emscripten-core/emsdk.git ~/.emsdk; \
	else \
		echo "Makefile found ~/.emsdk directory. Skipping emsdk installation."; \
	fi

	bash -c "source ~/.ghcup/env && ghcup install cabal $(CABAL_VERSION)"

	@echo "Installing javascript-unknown-ghcjs-ghc..."

	~/.emsdk/emsdk install $(EMSDK_VERSION)
	~/.emsdk/emsdk activate $(EMSDK_VERSION)

	bash -c "source ~/.ghcup/env && ghcup config add-release-channel cross"
	bash -c "source ~/.ghcup/env && source ~/.emsdk/emsdk_env.sh && emconfigure ghcup install ghc --set javascript-unknown-ghcjs-$(GHC_VERSION)"

	@echo ""
	@echo "INIT-HASKELL SUCCESSFUL."
	@echo "Please run 'source ~/.bashrc'."
	@echo ""
