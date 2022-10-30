#!/usr/bin/env bash

## tar-backups.sh
## Makes a tar backup of a directory, and if a backup of the given
## directory already exists, renames before making a new copy,
## just for safekeeping.

HOST=`/bin/hostname`
## No trailing slash!
DEST="/home/xxxxxxxxx"
MV=$(which mv)
MY_TAR="/bin/tar cip"

 if [ -f "$DEST/"${HOST}"-etc.tar" ]; then
    $MV $DEST/"${HOST}"-etc.tar $DEST/"${HOST}"-etc.tar.OLD
 fi
$MY_TAR /etc/ -f $DEST/$HOST-etc.tar


 if [ -f "$DEST/"${HOST}"-root-admin.tar" ]; then
    $MV $DEST/"${HOST}"-root-admin.tar $DEST/"${HOST}"-root-admin.tar.OLD
 fi
$MY_TAR /root/admin/ -f $DEST/$HOST-root-admin.tar


 if [ -f "$DEST/"${HOST}"-usr-local-etc-scripts.tar" ]; then
    $MV $DEST/"${HOST}"-usr-local-etc-scripts.tar $DEST/"${HOST}"-usr-local-etc-scripts.tar.OLD
 fi
$MY_TAR /usr/local/etc/scripts/ -f $DEST/$HOST-usr-local-etc-scripts.tar


 if [ -f "$DEST/"${HOST}"-var-spool-cron-crontabs.tar" ]; then
    $MV $DEST/"${HOST}"-var-spool-cron-crontabs.tar $DEST/"${HOST}"-var-spool-cron-crontabs.tar.OLD
 fi
$MY_TAR /var/spool/cron/crontabs/ -f $DEST/$HOST-var-spool-cron-crontabs.tar


 if [ -f "$DEST/"${HOST}"-home-deploy-staging-shared-config.tar" ]; then
    $MV $DEST/"${HOST}"-home-deploy-staging-shared-config.tar $DEST/"${HOST}"-home-deploy-staging-shared-config.tar.OLD
 fi
$MY_TAR /home/deploy/staging/shared/config/ -f $DEST/$HOST-home-deploy-staging-shared-config.tar

## EoF ##
