#!/usr/bin/env bash

## sync-files-to-usb.sh
## Copy some files
## from: Optiplex 755 - Debian Buster
## To: USB Backup (The Black Verbatim one)

RSYNC="/usr/bin/rsync"
RSYNC_FLAGS="-avzr --delete --progress"
ME=`/usr/bin/whoami`
MKDIR="mkdir -p"

BACKUP_PEN_DRIVE="Backup"

if [ -d "/media/$ME/$BACKUP_PEN_DRIVE/" -a -w "/media/$ME/$BACKUP_PEN_DRIVE/" ]; then

echo
echo "Todo OK... Backupeando..."
echo

DEST="/media/$ME/$BACKUP_PEN_DRIVE/Linux/hosts/Optiplex-755-usff"

$MKDIR $DEST/etc/
$MKDIR $DEST/etc/ssh/
$MKDIR $DEST/etc/apt/
$MKDIR $DEST/etc/lightdm/
$MKDIR $DEST/etc/ansible/

head -n 60 /etc/hosts > $DEST/etc/hosts.txt
$RSYNC /etc/fstab $DEST/etc/
$RSYNC /etc/sysctl.conf $DEST/etc/
$RSYNC /etc/ssh/sshd_config $DEST/etc/ssh/
$RSYNC /etc/ssh/banner $DEST/etc/ssh/
$RSYNC $RSYNC_FLAGS /etc/apt $DEST/etc/apt/
$RSYNC $RSYNC_FLAGS /etc/lightdm/ $DEST/etc/lightdm/
$RSYNC $RSYNC_FLAGS /etc/ansible/ $DEST/etc/ansible/

$MKDIR $DEST/home/$ME/
$MKDIR $DEST/home/$ME/Emacs/
$MKDIR $DEST/home/$ME/.links2/
$MKDIR $DEST/home/$ME/.ssh/
$MKDIR $DEST/home/$ME/Local
$MKDIR $DEST/home/$ME/.config/
$MKDIR $DEST/home/$ME/.config/vlc/
$MKDIR $DEST/home/$ME/.config/i3/

$RSYNC $RSYNC_FLAGS ~/todo.txt $DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.emacs $DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.bashrc $DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.bash_aliases $DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.Xresources $DEST/home/$ME/
$RSYNC $RSYNC_FLAGS ~/.links2/bookmarks.html $DEST/home/$ME/.links2/

cd ~/.config/vlc/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/vlc/

cd ~/.config/i3/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/i3/

cd ~/.config/i3status/
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.config/i3status/

cd ~/.ssh
$RSYNC $RSYNC_FLAGS * $DEST/home/$ME/.ssh/

cd ~/Local
$RSYNC $RSYNC_FLAGS --exclude 'DSCN8324.00.jpg' --exclude 'DSCN8325.00.jpg' --exclude 'Stuffs' * $DEST/home/$ME/Local/

cd ~/Emacs/
$RSYNC $RSYNC_FLAGS --exclude 'Backups/*' * $DEST/home/$ME/Emacs/

else
echo
echo
echo "The USB Drive is not mounted"
echo
echo
fi

## EoF ##
