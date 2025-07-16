# See also: https://www.haskell.org/ghcup/install/#system-requirements

DEBIAN_GENERIC   := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config"
DEBIAN_11_12     := "build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config"
DEBIAN_12_13     := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config"
DEBIAN_13        := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config"

UBUNTU_GENERIC   := "build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_2004_2010 := "build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_2010_23   := "build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_23        := "build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev"

FEDORA_GENERIC   := "gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl"

CENTOS_GENERIC   := "gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl"
CENTOS_7_8       := "gcc gcc-c++ gmp gmp-devel make ncurses xz perl"

ALPINE_GENERIC   := "binutils-gold curl gcc g++ gmp-dev libc-dev libffi-dev make musl-dev ncurses-dev perl tar xz"

SHELL := /bin/bash

.PHONY: init-ghc-dependencies

init-ghc-dependencies:
	@. /etc/os-release && \
	export DISTRO="$${ID,,}"; \
	case "$$DISTRO" in \
		debian) \
			echo "DEBIAN"; \
			;; \
		*) \
			echo "Unknown distribution. Please refer https://www.haskell.org/ghcup/install/#system-requirements"; \
			;; \
	esac
