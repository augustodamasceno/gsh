#!/bin/bash

##
#	This script recover the Grub from a live cd.
#
#	USAGE:
#		For legacy mode
#		./recover-grub.sh l
#		For uefi mode
#		./recover-grub.sh e
## 

## Testing the script, force exit.
exit 1

if [ $# -eq 0 ]
  then
	echo "Use \"l\" for legacy and \"e\" for uefi."
elif [[ $1 == "l" || $1 == "e" ]]
then
	echo "The root partition is encrypted? (Y/n)"
	echo -n "> "
	read okroot 
	if [ "$okroot" = "Y" ]; then okroot="y";fi  
	if [ "$okroot" = "y" ]  
	then  
		echo -n "Root partition: "
		read rootenc
		cryptsetup luksOpen $rootenc rootunenc
		rootp="/dev/mapper/rootunenc"
	else
		echo -n "Root partition: "
		read rootp
	fi
	echo -n "Boot partition: "
	read bootp
	echo -n "HD device"
	read hddev
else
	echo "Wrong option "
	echo "Use \"l\" for legacy and \"e\" for uefi."
fi

mountp="/recover-grub-mount"
mkdir $mountp
mount rootp $mountp
mount bootp $mountp"/boot"
if [ $1 == "e"  ]
then
	echo -n "Uefi partition: "
	read uefip
	mount uefip $mountp"/boot/efi"
fi
echo -n "Boot partition: "
read bootp
mount --rbind /dev $mountp"/dev"
mount --make-rslave $mountp"/dev"
mount -t proc /proc $mountp"/proc"
mount --rbind /sys $mountp"/sys"
mount --make-rslave $mountp"/sys"
mount --rbind /tmp $mountp"/tmp"
chroot $mountp
update-grub
grub-install $hddev
