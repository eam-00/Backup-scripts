#!/usr/bin/env bash

PRIORITY="/usr/bin/nice -n 19"
MYSQL_DUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip -9"

USER_00="root"
PASSWD_00="XXXXXXXXXXXXXXXx"

## Name of the database
DB_00="xxxxxxxx"

## Directory where the backup is stored, WITHOUT a trailing slash
DIR_DUMP_00="/var/db.dumps/xxxxxxxx"

## Nombre del archivo, lo normal es que sea el mismo nombre de la BD
DB_DUMP_00="tap_productio"

$PRIORITY $MYSQL_DUMP -u$USER_00 -p$PASSWD_00 $DB_00 | $PRIORITY $GZIP > $DIR_DUMP_00/$DB_DUMP_00-$(date '+%Y%m%d').sql.gz

## EoF ##
