# See also: https://www.haskell.org/ghcup/install/#system-requirements

export DEBIAN_GENERIC_VERSION   := Generic
export DEBIAN_GENERIC           := build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config
export DEBIAN_11_12_VERSION     := >= 11 && < 12
export DEBIAN_11_12             := build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config
export DEBIAN_12_13_VERSION     := >= 12 && < 13
export DEBIAN_12_13             := build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config
export DEBIAN_13_VERSION        := >= 13
export DEBIAN_13                := build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config
export DEBIAN_UPDATE_COMMAND    := apt-get update
export DEBIAN_INSTALL_COMMAND   := apt-get install -y

export UBUNTU_GENERIC_VERSION   := Generic
export UBUNTU_GENERIC           := build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
export UBUNTU_2004_2010_VERSION := >= 20.04 && < 20.10
export UBUNTU_2004_2010         := build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
export UBUNTU_2010_23_VERSION   := >= 20.10 && < 23
export UBUNTU_2010_23           := build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
export UBUNTU_23_VERSION        := >= 23
export UBUNTU_23                := build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev
export UBUNTU_UPDATE_COMMAND    := apt-get update
export UBUNTU_INSTALL_COMMAND   := apt-get install -y

export FEDORA_GENERIC_VERSION   := Generic
export FEDORA_GENERIC           := gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl
export FEDORA_UPDATE_COMMAND    := dnf update
export FEDORA_INSTALL_COMMAND   := dnf install -y

export CENTOS_GENERIC_VERSION   := Generic
export CENTOS_GENERIC           := gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl
export CENTOS_7_8_VERSION       := >= 7 && < 8
export CENTOS_7_8               := gcc gcc-c++ gmp gmp-devel make ncurses xz perl
export CENTOS_UPDATE_COMMAND    := yum update
export CENTOS_INSTALL_COMMAND   := yum install -y

export ALPINE_GENERIC_VERSION   := Generic
export ALPINE_GENERIC           := binutils-gold curl gcc g++ gmp-dev libc-dev libffi-dev make musl-dev ncurses-dev perl tar xz
export ALPINE_UPDATE_COMMAND    := apk update
export ALPINE_INSTALL_COMMAND   := apk add --no-confirm

SHELL := /bin/bash

.PHONY: init-ghc-dependencies

init-ghc-dependencies:
	@command -v curl >/dev/null 2>&1 || { echo "Please install curl"; exit 1; }

	@if curl -fsSL https://raw.githubusercontent.com/t-sasaki915/haskell-makefiles/refs/heads/main/utils/ghc-dependencies/internal.sh | bash; then \
		echo ""; \
		echo "INIT-GHC-DEPENDENCIES SUCCESSFUL."; \
		echo ""; \
	else \
		echo ""; \
		echo "Failed to install GHC dependencies. Please see https://www.haskell.org/ghcup/install/#system-requirements"; \
		echo ""; \
	fi
