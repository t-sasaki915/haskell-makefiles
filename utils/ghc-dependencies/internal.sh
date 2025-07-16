#!/bin/bash

. /etc/os-release
DISTRO="${ID,,}"

case "$DISTRO" in
		debian)
			OS_NAME="Debian"
			UPDATE_COMMAND="$DEBIAN_UPDATE_COMMAND"
			INSTALL_COMMAND="$DEBIAN_INSTALL_COMMAND"
			DEBIAN_VERSION=$(cut -d'.' -f1 < /etc/debian_version)
			if [ "$DEBIAN_VERSION" -ge 11 ] && [ "$DEBIAN_VERSION" -lt 12 ]; then
				VERSION_FRIENDLY="$DEBIAN_11_12_VERSION"
				DEPENDENCIES="$DEBIAN_11_12"
			elif [ "$DEBIAN_VERSION" -ge 12 ] && [ "$DEBIAN_VERSION" -lt 13 ]; then
				VERSION_FRIENDLY="$DEBIAN_12_13_VERSION"
				DEPENDENCIES="$DEBIAN_12_13"
			elif [ "$DEBIAN_VERSION" -ge 13 ]; then
				VERSION_FRIENDLY="$DEBIAN_13_VERSION"
				DEPENDENCIES="$DEBIAN_13"
			else
				VERSION_FRIENDLY="$DEBIAN_GENERIC_VERSION"
				DEPENDENCIES="$DEBIAN_GENERIC"
			fi
			;;
		ubuntu)
			echo "UBUNTU"
			;;
		fedora)
			OS_NAME="Fedora"
			UPDATE_COMMAND="$FEDORA_UPDATE_COMMAND"
			INSTALL_COMMAND="$FEDORA_INSTALL_COMMAND"
			VERSION_FRIENDLY="$FEDORA_GENERIC_VERSION"
			DEPENDENCIES="$FEDORA_GENERIC"
			;;
		centos)
			echo "CENTOS"
			;;
		alpine)
			OS_NAME="Alpine"
			UPDATE_COMMAND="$ALPINE_UPDATE_COMMAND"
			INSTALL_COMMAND="$ALPINE_INSTALL_COMMAND"
			VERSION_FRIENDLY="$ALPINE_GENERIC_VERSION"
			DEPENDENCIES="$ALPINE_GENERIC"
			;;
		*)
			echo "Unknown distribution. Please refer https://www.haskell.org/ghcup/install/#system-requirements"
			;;
	esac
	echo "Installing GHC dependencies for $OS_NAME $VERSION_FRIENDLY..."
	echo $UPDATE_COMMAND
	echo $INSTALL_COMMAND $DEPENDENCIES
