#!/bin/bash
# Run aircrack-ng with bigger pcapdump file from Kismet and a wordlist.

alias_airkiss()
{
	echo 'Running:'
	echo  'aircrack-ng ~/kismet/'$(ls ~/kismet/ --sort=size | head -n 1)' -w '$1
	aircrack-ng ~/kismet/$(ls ~/kismet/ --sort=size | head -n 1) -w $1
}
alias airkiss=alias_airkiss
