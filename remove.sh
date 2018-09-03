#!/bin/bash

# Backup previous ~/.bashrc-backup file
if (test -e ~/.bashrc-backup)
    then
        mv ~/.bashrc-backup ~/.bashrc-backup-movein$(date +"%d%h%y_%H-%M-%S")
fi

# Create a backup for file ~/.bashrc
if (test -e ~/.bashrc)
    then
        cp ~/.bashrc ~/.bashrc-backup
fi

# Remove previous alias scripts in the file ~/.bashrc
nlines=$(cat ~/.bashrc | wc -l)
blines=$(grep -B $nlines -e Scripts4bash-----.begin ~/.bashrc | wc -l)
blines=`expr $blines - 1`
alines=$(grep -A $nlines -e Scripts4bash-----.end ~/.bashrc | wc -l)
alines=`expr $alines - 1`

cat ~/.bashrc | head -n $blines > s4bash-remove.tmp
cat ~/.bashrc | tail -n $alines >> s4bash-remove.tmp
cat s4bash-remove.tmp > ~/.bashrc
rm s4bash-remove.tmp
