#!/bin/bash

s4bash_alias()
{
	echo "Installing scripts4bash alias scripts"
	echo "#-----Scripts4bash-----.begin-----#" >> ~/.bashrc
	cat alias/*.cmd >> ~/.bashrc 
	echo "PATH=$PATH:$HOME/.s4bash" >> ~/.bashrc 
	echo "#-----Scripts4bash-----.end-------#" >> ~/.bashrc
}

s4bash_scripts()
{
	echo "Installing scripts4bash scripts"
	if [ ! -d $HOME"/.s4bash" ]
	then
		mkdir ~/.s4bash
	fi
	cp scripts/* ~/.s4bash/
	rm ~/.s4bash/README.md
}

inst=$(cat ~/.bashrc | grep Scripts4bash | wc -l)
if [ "$inst" -eq "0" ]
then
	s4bash_alias
	s4bash_scripts
else
	echo -n "Scripts4bash already installed. Do you wish to remove and install the new version? (Y/n). "
	read ok  
	if [ "$ok" = "Y" ]; then ok="y";fi  
	if [ "$ok" = "y" ]  
	then
		echo "Running remove.sh"
		bash remove.sh
		s4bash_alias		
		s4bash_scripts
	else
		echo "Nothing done."
	fi
fi

