#!/bin/bash

# Rename all files with a pattern.
#
# This script is configured to change all ":"
#	in screenshot files in the folder "Pictures"


## Configuration of the search

# Files in Pictures/ folder
foldername='Pictures/'
# With creenshot as part of the name
filterwith='creenshot'
# And : char
filterwith2=':'
# Change : for _
renameexpression='s/:/_/'

## Save all files with search required patterns
find `pwd` | grep $(whoami) | grep $foldername | grep $filterwith | grep $filterwith2 | grep '.png' > myrenamefile

## Print an example

echo 'The result will be the following'

echo 'This file'
echo $(echo \'$(tail -n 1 myrenamefile)\')
echo 'becomes'
echo $( echo \'$(tail -n 1 myrenamefile)\' | sed -e $renameexpression)

## Ask if this is what the user want

echo -n 'Are you sure that you want to continue? (y/N) '
read ok

## Make the changes

if [ "$ok" = "Y" ]; then ok="y";fi
if [ "$ok" = "y" ]
then
	it=1
	for i in $(wc -l myrenamefile){0}
	do
		echo $i
		while [ "$i" -ge "$it" ]
		do
			echo 'Renaming file '$it
			rename $renameexpression "$(tail -n $it myrenamefile | head -n 1)"
			it=$(($it+1))
		done
		break
	done
fi

