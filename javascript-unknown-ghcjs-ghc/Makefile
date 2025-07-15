CABAL_VERSION := 3.14.2.0
GHC_VERSION   := 9.12.2
EMSDK_VERSION := 3.1.74

SHELL := /bin/bash

.PHONY: init-tools

init-tools:
ifeq (, $(shell which curl))
	$(error Please install curl)
endif
ifeq (, $(shell which git))
	$(error Please install git)
endif
	
	export BOOTSTRAP_HASKELL_NONINTERACTIVE=1; \
	export BOOTSTRAP_HASKELL_MINIMAL=1; \
	export BOOTSTRAP_HASKELL_ADJUST_BASHRC=1; \
	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

	bash -c "source ~/.ghcup/env && ghcup install cabal $(CABAL_VERSION)"

	git clone https://github.com/emscripten-core/emsdk.git ~/.emsdk
	~/.emsdk/emsdk install $(EMSDK_VERSION)
	~/.emsdk/emsdk activate $(EMSDK_VERSION)

	bash -c "source ~/.ghcup/env && ghcup config add-release-channel cross"
	bash -c "source ~/.ghcup/env && source ~/.emsdk/emsdk_env.sh && emconfigure ghcup install ghc --set javascript-unknown-ghcjs-$(GHC_VERSION)"

	@echo ""
	@echo "INIT-ENV SUCCESSFUL."
	@echo "Please run 'source ~/.bashrc'."
	@echo ""
