#!/usr/bin/env bash

echo
echo ========================
echo Type the server hostname:
echo ========================
read server_name
echo
echo

cmd_rsync=$(which rsync)
opt_rsync_dryrun="-e ssh --progress --delete -navzr"
opt_rsync_real="-e ssh --progress --delete -avzr"

## X60
cd ~/Local/
${server_name}:~/Local/

cd ~/Dropbox
${cmd_rsync} -e ssh --progress --delete -avzr * ${server_name}:~/Dropbox/

## EoF ##

