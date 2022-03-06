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

function rsync_dropbox () {
cd ~/Dropbox
${cmd_rsync} ${opt_rsync_dryrun} * ${server_name}:~/Dropbox/
}

function rsync_local () {
cd ~/Local
${cmd_rsync} ${opt_rsync_dryrun} * ${server_name}:~/Local/
}

function rsync_music () {
cd ~/Music
${cmd_rsync} ${opt_rsync_dryrun} * ${server_name}:~/Music/
}


if [ ${server_name} == x60 ]; then
rsync_local
rsync_dropbox

elif [ ${server_name} == t410 ]; then
rsync_local
rsync_dropbox

else

cd ~/Dropbox
echo -e "Proceed with Dropbox Rsync... "
rsync_dropbox
fi

## EOF ##
