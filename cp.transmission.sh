#!/usr/bin/env bash

PROC='transmission'
cmd_whoami=$(which whoami)
BACKUP_PEN_DRIVE='Backup'

case "$(pgrep $PROC | wc -w)" in

0)  echo "Great: $PROC is not running, proceed with copy..."
    cd ~/.config/
    cp -R transmission transmission.$(date '+%Y-%m-%d')
    cd /media/${cmd_whoami}/$BACKUP_PEN_DRIVE/Linux/hosts/viking/transmission/
    cp -f -R * ~/.config/transmission/
    exit 1
    ;;
1)  echo "Warning: $PROC is running, stopping this copy..."
    exit 0
    ;;
esac

## EoF ##
