#!/bin/bash
# Show git branch

# Backup PS1
OLDPS1=$PS1

sgbranch()
{
	if $($n) > 0
		then
			eval last=\${$#}
			echo $last
	fi
	#if [ "eval last=\${$#}" == "true" ]
	#	then
	#		echo $last	
	#fi

	#eval last=\${$#}
	#echo $last
}

# CMD
sgbranch $( git branch | grep \*)

# Change your PS1 for ($ branch_name $) : 
# 
# PS1=$PS1$(sgbranch $( git branch | grep \*))$(echo " $ ")


