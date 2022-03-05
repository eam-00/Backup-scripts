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

if [ ${server_name} == X60 ]; then
cd ~/Local/
${cmd_rsync} ${opt_rsync_dryrun} ${server_name}:~/Local/

elif [ ${server_name} == t410 ]; then
cd ~/Local/
${cmd_rsync} ${opt_rsync_dryrun} ${server_name}:~/Local/

elif [ -d "~/Dropbox" ]; then
cd ~/Dropbox
${cmd_rsync} -e ssh --progress --delete -avzr * ${server_name}:~/Dropbox/

else

echo -e "Host not found"

fi

## EoF ##

