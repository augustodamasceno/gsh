#!/bin/bash
# Show git branch
# Command modified from: https://wiki.archlinux.org/index.php/Git

# Backup PS1
OLDPS1=$PS1

# CMD
PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '

## FEDORA
# source /usr/share/git-core/contrib/completion/git-prompt.sh
# export PS1='[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
