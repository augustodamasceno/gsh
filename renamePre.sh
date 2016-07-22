#!/bin/bash

# ADD Prefix to All Files in Current Folder
# The user must confirm
# sh renamePre.sh the-prefix


pre=$1
if [ ${#1} -gt 0 ]
then
	userMsg1='Rename all files in this folder adding the prefix \042'
	echo -n $userMsg1$pre'\042 (y/N) '
	read ok
	
	if [ "$ok" = "Y" ]; then ok="y";fi
	if [ "$ok" = "y" ]
	then
		for i in *
		do
			newname=$pre$i
			echo "renaming $i to $newname"
			mv $i $newname
		done
	fi
fi

