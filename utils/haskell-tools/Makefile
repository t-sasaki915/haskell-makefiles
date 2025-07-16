CABAL_VERSION := 3.14.2.0
STACK_VERSION := 3.3.1
HLS_VERSION   := 2.10.0.0
INSTALL_CABAL := 1
INSTALL_STACK := 1
INSTALL_HLS   := 1

.PHONY: init-haskell-tools

init-haskell-tools:
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

	@if [ "$(INSTALL_CABAL)" = "1" ]; then \
		if [ ! -e "$$HOME/.ghcup/bin/cabal-$(CABAL_VERSION)" ]; then \
			echo "Installing cabal..."; \
			bash -c "source $$HOME/.ghcup/env && ghcup install cabal $(CABAL_VERSION)"; \
		else \
			echo "cabal-$(CABAL_VERSION) has already been installed."; \
		fi \
	fi

	@if [ "$(INSTALL_STACK)" = "1" ]; then \
		if [ ! -e "$$HOME/.ghcup/bin/stack-$(STACK_VERSION)" ]; then \
			echo "Installing stack..."; \
			bash -c "source $$HOME/.ghcup/env && ghcup install stack $(STACK_VERSION)"; \
		else \
			echo "stack-$(STACK_VERSION) has already been installed."; \
		fi \
	fi

	@if [ "$(INSTALL_HLS)" = "1" ]; then \
		if ! ls "$$HOME/.ghcup/bin"/"haskell-language-server"*"~$(HLS_VERSION)" 1>/dev/null 2>&1; then \
			echo "Installing haskell-language-server..."; \
			bash -c "source $$HOME/.ghcup/env && ghcup install hls $(HLS_VERSION)"; \
		else \
			echo "haskell-language-server-$(HLS_VERSION) has already been installed."; \
		fi \
	fi
