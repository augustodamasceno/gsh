#!/usr/bin/env bash
#
# gsh - Installs gsh scripts to ~/.gsh and adds it to PATH
#
# Copyright (c) 2015-2026, Augusto Damasceno.
# All rights reserved.
# SPDX-License-Identifier: GPL-3.0
#
# See https://github.com/augustodamasceno/gsh
#
# Usage: install.sh [--with-deps] [-y]
#   --with-deps  also install runtime dependencies via install-deps.sh
#   -y           non-interactive (passed through to install-deps.sh)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WITH_DEPS=0
AUTO_YES=0
for arg in "$@"; do
    [[ "$arg" == "--with-deps" ]] && WITH_DEPS=1
    [[ "$arg" == "-y" ]]          && AUTO_YES=1
done

if [[ $WITH_DEPS -eq 1 ]]; then
    dep_args=()
    [[ $AUTO_YES -eq 1 ]] && dep_args+=("-y")
    bash "$SCRIPT_DIR/install-deps.sh" "${dep_args[@]}"
fi

# Identify instalation by the folder ~/.gsh existence.
if [ ! -d $HOME"/.gsh" ]
then
	echo "Installing gsh scripts"

	# Creates the gsh directory.
	mkdir ~/.gsh

	# Append ~/.gsh to the PATH variable in bash and zsh rcfiles.
	if [ -f $HOME"/.bashrc" ]
	then
		echo "Appending "$HOME"/.gsh to the PATH variable in the bashrc file"
			echo "PATH=\"$PATH:$HOME/.gsh\"" >> ~/.bashrc
	fi
	if [ -f $HOME"/.zshrc" ]
	then
		echo "Appending "$HOME"/.gsh to the PATH variable in the zshrc file"
			echo "PATH=\"$PATH:$HOME/.gsh\"" >> ~/.zshrc
	fi
else
	echo "Updating gsh scripts"
	echo "All files in the ~/.gsh folder will be deleted. Proceed? (Y/n)"
	read ok  
	if [ "$ok" = "Y" ]; then ok="y";fi  
	if [ "$ok" = "y" ]  
	then  
		echo "GSH updated!"  
		rm ~/.gsh/*
	else
		echo "GSH was not updated."
	fi  
fi

# Copy all gsh scripts to the local instalation with execution permission.
cp scripts/* ~/.gsh/
chmod +x ~/.gsh/*

