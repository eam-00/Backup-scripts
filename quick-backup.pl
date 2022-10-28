#!/usr/bin/env perl

## Directory where the backups are stored
my $BackupDir = "/var/backups/quick-backups";
## tar options
my $tar = "/usr/bin/tar cipz";

system("$tar /var/spool/cron/ -f $BackupDir/crontabs.tgz");
system("$tar /etc/ -f $BackupDir/etc.tgz");

exit 1;

## EoF ##
