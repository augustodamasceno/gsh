#!/bin/bash

inst=$(cat ~/.bashrc | grep Scripts4bash | wc -l)
if [ "$inst" -eq "0" ]
then
	echo "#------Scripts4bash-------------" >> ~/.bashrc
	cat cmd/cd.cmd >> ~/.bashrc
	cat cmd/showGitBranch.cmd  >> ~/.bashrc
	cat cmd/markhere.cmd >> ~/.bashrc
	cat cmd/toptop.cmd >> ~/.bashrc
	cat cmd/airkiss.cmd >> ~/.bashrc
	cat cmd/getip.cmd >> ~/.bashrc
	cat cmd/namekill.cmd >> ~/.bashrc
	cat cmd/getnames.cmd >> ~/.bashrc
	cat cmd/qrcode.cmd >> ~/.bashrc
	cat cmd/dsize.cmd >> ~/.bashrc
	cat cmd/allusers.cmd >> ~/.bashrc
	echo "#------Scripts4bash-------------" >> ~/.bashrc
else
	echo "Scripts4bash already installed. Remove previous commands first."
fi 

