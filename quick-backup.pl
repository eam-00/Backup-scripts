#!/usr/bin/env perl

## my $BackupDir = "/var/backups/quick-backups";
my $BackupDir = "/tmp/";
my $tar = "/usr/bin/tar cipz";

system("$tar /var/spool/cron/ -f $BackupDir/crontabs.tgz");
system("$tar /etc/ -f $BackupDir/etc.tgz");

exit 1;

## EoF ##
