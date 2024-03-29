#!/usr/bin/env bash

PRIORITY="/usr/bin/nice -n 19"
cmd_mysqldump=$(which mysqldump)
cmd_gzip=$(which gzip)" -9"

USER_00="root"
PASSWD_00="XXXXXXXXXXXXXXXx"

## Name of the database
DB_00="xxxxxxxx"

## Directory where the backup is stored, WITHOUT a trailing slash
DIR_DUMP_00="/var/db.dumps/xxxxxxxx"

## Name of the dump file, usually, the same name as the DB
DB_DUMP_00="xxxxxxxx"

$PRIORITY $cmd_mysqldump -u$USER_00 -p$PASSWD_00 $DB_00 | $PRIORITY $cmd_gzip > $DIR_DUMP_00/$DB_DUMP_00-$(date '+%Y%m%d').sql.gz

## EoF ##
