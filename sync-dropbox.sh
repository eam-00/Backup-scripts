#!/usr/bin/env bash

echo
echo ========================
echo Type the server hostname:
echo ========================
read server_name
echo
echo

cd ~/Dropbox
rsync -e ssh --progress --delete -avzr * ${server_name}:~/Dropbox/

## EoF ##

