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
			OS_NAME="Ubuntu"
            UPDATE_COMMAND="$UBUNTU_UPDATE_COMMAND"
            INSTALL_COMMAND="$UBUNTU_INSTALL_COMMAND"
            UBUNTU_VERSION=$(. /etc/os-release && echo "$VERSION_ID")
            if dpkg --compare-versions "$UBUNTU_VERSION" ge "20.04" && dpkg --compare-versions "$UBUNTU_VERSION" lt "20.10"; then
                VERSION_FRIENDLY="$UBUNTU_2004_2010_VERSION"
                DEPENDENCIES="$UBUNTU_2004_2010"
            elif dpkg --compare-versions "$UBUNTU_VERSION" ge "20.10" && dpkg --compare-versions "$UBUNTU_VERSION" lt "23"; then
                VERSION_FRIENDLY="$UBUNTU_2010_23_VERSION"
                DEPENDENCIES="$UBUNTU_2010_23"
            elif dpkg --compare-versions "$UBUNTU_VERSION" ge "23"; then
                VERSION_FRIENDLY="$UBUNTU_23_VERSION"
                DEPENDENCIES="$UBUNTU_23"
            else
                VERSION_FRIENDLY="$UBUNTU_GENERIC_VERSION"
                DEPENDENCIES="$UBUNTU_GENERIC"
            fi
			;;
		fedora)
			OS_NAME="Fedora"
			UPDATE_COMMAND="$FEDORA_UPDATE_COMMAND"
			INSTALL_COMMAND="$FEDORA_INSTALL_COMMAND"
			VERSION_FRIENDLY="$FEDORA_GENERIC_VERSION"
			DEPENDENCIES="$FEDORA_GENERIC"
			;;
		centos)
			OS_NAME="CentOS"
            UPDATE_COMMAND="$CENTOS_UPDATE_COMMAND"
            INSTALL_COMMAND="$CENTOS_INSTALL_COMMAND"
            CENTOS_VERSION=$(rpm -q --qf '%{VERSION}\n' centos-release | cut -d'.' -f1)
            if [ "$CENTOS_VERSION" -ge 7 ] && [ "$CENTOS_VERSION" -lt 8 ]; then
                VERSION_FRIENDLY="$CENTOS_7_8_VERSION"
                DEPENDENCIES="$CENTOS_7_8"
            else
                VERSION_FRIENDLY="$CENTOS_GENERIC_VERSION"
                DEPENDENCIES="$CENTOS_GENERIC"
            fi
			;;
		alpine)
			OS_NAME="Alpine"
			UPDATE_COMMAND="$ALPINE_UPDATE_COMMAND"
			INSTALL_COMMAND="$ALPINE_INSTALL_COMMAND"
			VERSION_FRIENDLY="$ALPINE_GENERIC_VERSION"
			DEPENDENCIES="$ALPINE_GENERIC"
			;;
		*)
			echo "Unknown distribution."
            exit 1;
			;;
	esac

	echo "Installing GHC dependencies for $OS_NAME $VERSION_FRIENDLY..."
	sudo $UPDATE_COMMAND
	sudo $INSTALL_COMMAND $DEPENDENCIES
