#!/bin/bash
# Show git branch on

#echo $( git branch | grep \* | tail -c $(wc -c $(git branch | grep \*)) )
names()
{
  names=($@)
  echo ${names[@]:$#-1}

}

names $( git branch | grep \*)

PS1=$(names $( git branch | grep \*)) - $PS1
