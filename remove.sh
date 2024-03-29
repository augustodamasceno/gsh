#!/bin/bash
############################################
# This script is part of the GSH software.
# GSH Uninstaller
# # Copyright (c) 2015-2024, Augusto Damasceno.
# All rights reserved.  
# SPDX-License-Identifier: GPL-3.0
############################################

echo "Removing gsh scripts"
rm -rf ~/.gsh


# Remove apppend command that puts ~/.gsh into the PATH variable in bash and zsh rcfiles.
if [ -f $HOME"/.bashrc" ]
then
	echo -e "Remove append command thats puts "$HOME"/.gsh "
	echo "into the PATH variable in the bashrc file"
	grep -v "PATH=$PATH:$HOME/.gsh" ~/.bashrc > gsh-remove-temp
	cat gsh-remove-temp > ~/.bashrc
	rm gsh-remove-temp
fi
if [ -f $HOME"/.zshrc" ]
then
	echo -e "Remove append command thats puts "$HOME"/.gsh "
	echo "into the PATH variable in the zshrc file"
	grep -v "PATH=$PATH:$HOME/.gsh" ~/.zshrc > gsh-remove-temp
	cat gsh-remove-temp > ~/.zshrc
	rm gsh-remove-temp
fi

