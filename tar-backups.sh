#!/usr/bin/env bash

## tar-backups.sh
## Makes a tar backup of a directory, and if a backup of the given
## directory already exists, renames it first, so there is an old
## copy of it, just in case.

HOST=`/bin/hostname`
DEST="/home/xxxxxxxxx"
MV="/bin/mv"
TAR="/bin/tar cip"

 if [ -f "$DEST/"${HOST}"-etc.tar" ]; then
    $MV $DEST/"${HOST}"-etc.tar $DEST/"${HOST}"-etc.tar.OLD
 fi
$TAR /etc/ -f $DEST/$HOST-etc.tar


 if [ -f "$DEST/"${HOST}"-root-admin.tar" ]; then
    $MV $DEST/"${HOST}"-root-admin.tar $DEST/"${HOST}"-root-admin.tar.OLD
 fi
$TAR /root/admin/ -f $DEST/$HOST-root-admin.tar


 if [ -f "$DEST/"${HOST}"-usr-local-etc-scripts.tar" ]; then
    $MV $DEST/"${HOST}"-usr-local-etc-scripts.tar $DEST/"${HOST}"-usr-local-etc-scripts.tar.OLD
 fi
$TAR /usr/local/etc/scripts/ -f $DEST/$HOST-usr-local-etc-scripts.tar


 if [ -f "$DEST/"${HOST}"-var-spool-cron-crontabs.tar" ]; then
    $MV $DEST/"${HOST}"-var-spool-cron-crontabs.tar $DEST/"${HOST}"-var-spool-cron-crontabs.tar.OLD
 fi
$TAR /var/spool/cron/crontabs/ -f $DEST/$HOST-var-spool-cron-crontabs.tar


 if [ -f "$DEST/"${HOST}"-home-deploy-staging-shared-config.tar" ]; then
    $MV $DEST/"${HOST}"-home-deploy-staging-shared-config.tar $DEST/"${HOST}"-home-deploy-staging-shared-config.tar.OLD
 fi
$TAR /home/deploy/staging/shared/config/ -f $DEST/$HOST-home-deploy-staging-shared-config.tar

## EoF ##
