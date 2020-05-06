#!/usr/bin/env bash

## sync-files-to-usb.sh
## Rsyncs some files to a USB drive, makes a mirror copy from the origin
## from: Thinkpad T60p
## To: USB Backup (The Black Verbatim one)

RSYNC='/usr/bin/rsync'
RSYNC_FLAGS='-avzr --delete --progress'
ME=`/usr/bin/whoami`
MKDIR='mkdir -p'
BACKUP_PEN_DRIVE='Backup'

$MKDIR /media/$ME/$BACKUP_PEN_DRIVE/Linux/hosts/T60p

if [ -d "/media/$ME/$BACKUP_PEN_DRIVE/" -a -w "/media/$ME/$BACKUP_PEN_DRIVE/" ]
then

    echo "OK... Backup Starting..."

DEST="/media/$ME/$BACKUP_PEN_DRIVE/Linux/hosts/T60p"

$MKDIR $DEST/etc/
$MKDIR $DEST/etc/ssh/
$MKDIR $DEST/etc/apt/
$MKDIR $DEST/etc/lightdm/

$RSYNC $RSYNC_FLAGS /etc/hosts			$DEST/etc/
$RSYNC $RSYNC_FLAGS /etc/fstab			$DEST/etc/
$RSYNC $RSYNC_FLAGS /etc/sysctl.conf		$DEST/etc/
$RSYNC $RSYNC_FLAGS /etc/ssh/sshd_config	$DEST/etc/ssh/
$RSYNC $RSYNC_FLAGS /etc/ssh/banner		$DEST/etc/ssh/

cd /etc/apt/
$RSYNC $RSYNC_FLAGS * $DEST/etc/apt/

cd /etc/lightdm/
$RSYNC $RSYNC_FLAGS * $DEST/etc/lightdm/

$MKDIR $DEST/home/$ME/
$MKDIR $DEST/home/$ME/Emacs/
$MKDIR $DEST/home/$ME/.links2/
$MKDIR $DEST/home/$ME/.ssh/
$MKDIR $DEST/home/$ME/Local
$MKDIR $DEST/home/$ME/.config/
$MKDIR $DEST/home/$ME/.config/vlc/
$MKDIR $DEST/home/$ME/.config/i3/

$RSYNC $RSYNC_FLAGS ~/.emacs			$DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.bashrc			$DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.Xresources		$DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.links2/bookmarks.html	$DEST/home/$ME/.links2/

cd /home/$ME/.config/vlc/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/vlc/

cd /home/$ME/.config/i3/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/i3/

cd /home/$ME/.config/i3status/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/i3status/

cd /home/$ME/.ssh
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.ssh/

cd /home/$ME/Local
$RSYNC $RSYNC_FLAGS --exclude 'DSCN8324.00.jpg' --exclude 'DSCN8325.00.jpg' * $DEST/home/$ME/Local/

cd /home/$ME/Emacs/
$RSYNC $RSYNC_FLAGS --exclude 'Backups/*' * $DEST/home/$ME/Emacs/

fi

## EoF ##
