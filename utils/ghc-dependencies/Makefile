# See also: https://www.haskell.org/ghcup/install/#system-requirements

DEBIAN_GENERIC_VERSION   := "Generic"
DEBIAN_GENERIC           := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config"
DEBIAN_11_12_VERSION     := ">= 11 && < 12"
DEBIAN_11_12             := "build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config"
DEBIAN_12_13_VERSION     := ">= 12 && < 13"
DEBIAN_12_13             := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 pkg-config"
DEBIAN_13_VERSION        := ">= 13"
DEBIAN_13                := "build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev libncurses6 libtinfo6 pkg-config"
DEBIAN_UPDATE_COMMAND    := "apt-get update"
DEBIAN_INSTALL_COMMAND   := "apt-get install -y"

UBUNTU_GENERIC_VERSION   := "Generic"
UBUNTU_GENERIC           := "build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_2004_2010_VERSION := ">= 20.04 && < 20.10"
UBUNTU_2004_2010         := "build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_2010_23_VERSION   := ">= 20.10 && < 23"
UBUNTU_2010_23           := "build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5"
UBUNTU_23_VERSION        := ">= 23"
UBUNTU_23                := "build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev"
UBUNTU_UPDATE_COMMAND    := "apt-get update"
UBUNTU_INSTALL_COMMAND   := "apt-get install -y"

FEDORA_GENERIC_VERSION   := "Generic"
FEDORA_GENERIC           := "gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl"
FEDORA_UPDATE_COMMAND    := "dnf update"
FEDORA_INSTALL_COMMAND   := "dnf install -y"

CENTOS_GENERIC_VERSION   := "Generic"
CENTOS_GENERIC           := "gcc gcc-c++ gmp gmp-devel make ncurses ncurses-compat-libs xz perl"
CENTOS_7_8_VERSION       := ">= 7 && < 8"
CENTOS_7_8               := "gcc gcc-c++ gmp gmp-devel make ncurses xz perl"
CENTOS_UPDATE_COMMAND    := "yum update"
CENTOS_INSTALL_COMMAND   := "yum install -y"

ALPINE_GENERIC_VERSION   := "Generic"
ALPINE_GENERIC           := "binutils-gold curl gcc g++ gmp-dev libc-dev libffi-dev make musl-dev ncurses-dev perl tar xz"
ALPINE_UPDATE_COMMAND    := "apk update"
ALPINE_INSTALL_COMMAND   := "apk add --no-confirm"

SHELL := /bin/bash

.PHONY: init-ghc-dependencies

init-ghc-dependencies:
	@. /etc/os-release && \
	DISTRO="$${ID,,}"; \
	case "$$DISTRO" in \
		debian) \
			@OS_NAME="Debian"; \
			UPDATE_COMMAND=$(DEBIAN_UPDATE_COMMAND); \
			INSTALL_COMMAND=$(DEBIAN_INSTALL_COMMAND); \
			DEBIAN_VERSION=$(cut -d'.' -f1 < /etc/debian_version); \
			if [ "$$DEBIAN_VERSION" -ge 11 ] && [ "$$DEBIAN_VERSION" -lt 12 ]; then \
				VERSION_FRIENDLY=$(DEBIAN_11_12_VERSION); \
				DEPENDENCIES="$(DEBIAN_11_12)"; \
			else if [ "$$DEBIAN_VERSION" -ge 12 ] && [ "$$DEBIAN_VERSION" -lt 13 ]; then \
				VERSION_FRIENDLY=$(DEBIAN_12_13_VERSION); \
				DEPENDENCIES="$(DEBIAN_12_13)"; \
			else if [ "$$DEBIAN_VERSION" -ge 13 ]; then \
				VERSION_FRIENDLY=$(DEBIAN_13_VERSION); \
				DEPENDENCIES="$(DEBIAN_13)"; \
			else \
				VERSION_FRIENDLY=$(DEBIAN_GENERIC_VERSION); \
				DEPENDENCIES="$(DEBIAN_GENERIC)"; \
			fi \
			;; \
		ubuntu) \
			echo "UBUNTU"; \
			;; \
		fedora) \
			@OS_NAME="Fedora"; \
			UPDATE_COMMAND=$(FEDORA_UPDATE_COMMAND); \
			INSTALL_COMMAND=$(FEDORA_INSTALL_COMMAND); \
			VERSION_FRIENDLY=$(FEDORA_GENERIC_VERSION); \
			DEPENDENCIES=$(FEDORA_GENERIC); \
			;; \
		centos) \
			echo "CENTOS"; \
			;; \
		alpine)
			@OS_NAME="Alpine"; \
			UPDATE_COMMAND=$(ALPINE_UPDATE_COMMAND); \
			INSTALL_COMMAND=$(ALPINE_INSTALL_COMMAND); \
			VERSION_FRIENDLY=$(ALPINE_GENERIC_VERSION); \
			DEPENDENCIES=$(ALPINE_GENERIC); \
			;; \
		*) \
			echo "Unknown distribution. Please refer https://www.haskell.org/ghcup/install/#system-requirements"; \
			;; \
	esac \
	echo "Installing GHC dependencies for $${OS_NAME} $${VERSION_FRIENDLY}..."; \
	echo $${UPDATE_COMMAND}; \
	echo $${INSTALL_COMMAND} $${DEPENDENCIES}
