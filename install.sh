#!/bin/bash


# Create ~/.gsh if the folder does not exist.
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
	rm ~/.gsh/*
fi

# Copy all gsh scripts to the local instalation with execution permission.
cp scripts/* ~/.gsh/
chmod +x -R ~/.gsh/


