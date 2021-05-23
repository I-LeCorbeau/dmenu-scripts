#!/bin/sh

## poweroffreboot for OpenBSD by Ian LeCorbeau
##
## Small script to poweroff or reboot an OpenBSD machine with dmenu.
## In order to work, the user needs to be able to run the appropriate
## commands without a password, by adding the lines:
## 'permit nopass <username> as root cmd /sbin/shutdown args -p now' and
## 'permit nopass <username> as root cmd /sbin/shutdown args -r now'
## to etc/doas.conf

CHOICE=$(printf '%s\n' "Shutdown" "Reboot" | dmenu -p ?)

case "$CHOICE" in
	Shutdown) doas /sbin/shutdown -p now ;;
	Reboot) doas /sbin/shutdown -r now ;;
esac
