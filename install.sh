#!/bin/bash


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
		echo "PATH=$PATH:$HOME/.gsh" >> ~/.bashrc
	fi
	if [ -f $HOME"/.zshrc" ]
	then
		echo "Appending "$HOME"/.gsh to the PATH variable in the zshrc file"
		echo "PATH=$PATH:$HOME/.gsh" >> ~/.zshrc
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
chmod +x -R ~/.gsh/


