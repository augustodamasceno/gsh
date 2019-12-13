#!/bin/bash


echo "Installing gsh scripts"

# Create ~/.gsh if the folder does not exist.
if [ ! -d $HOME"/.gsh" ]
then
	mkdir ~/.gsh
fi

# Copy all gsh scripts to the local instalation with execution permission.
cp scripts/* ~/.gsh/
chmod +x -R ~/.gsh/

# Append ~/.gsh to the PATH variable in bash and zsh rcfiles.
if [ -d $HOME"/.bashrc" ]
then
	echo "PATH=$PATH:$HOME/.gsh" >> ~/.bashrc
fi
if [ -d $HOME"/.zshrc" ]
then
	echo "PATH=$PATH:$HOME/.gsh" >> ~/.zshrc
fi

