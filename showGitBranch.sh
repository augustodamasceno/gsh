#!/bin/bash
# Show git branch
# Command modified from: https://wiki.archlinux.org/index.php/Git

# Backup PS1
OLDPS1=$PS1

# CMD
PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
