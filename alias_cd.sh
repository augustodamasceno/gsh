#!/bin/bash
# List directory contents when cd command is used.

alias_cd()
{
  cd $1
  printf "\n"
  for i in $(seq $(tput cols))
  do
    printf "_";
  done
  printf "\n\n"
  ls
  for i in $(seq $(tput cols))
  do
    printf "_";
  done
  printf "\n\n"
}
alias cd=alias_cd
