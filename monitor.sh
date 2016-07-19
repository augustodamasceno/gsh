#!/bin/bash

# Print every 'timeSleep' seconds:
#
# Who is Logged on and What They are Doing
# Cpus Stats
# Top 3 Cpu Use
# Memory Use
# Top 3 Mem Use


printTitle()
{
	local name=$1
	local nMinus=`expr $cols - ${#name}`
	printf '\033[0;31m'
	for i in `seq 1 2 $nMinus`
	do
		printf '-'
	done
	printf $name
	for i in `seq 2 2 $nMinus`
	do
		printf '-'
	done
	printf '\033[0m\n'
}

cpulines=`expr $(cat /proc/cpuinfo | grep processor | wc -l) + 2`
timeSleep=3
while true
do
	cols=$(tput cols)
	clear
	printTitle BEGIN-MONITOR
	date
	printTitle USERS
	w
	printTitle CPU
	mpstat -P ALL | tail -n $cpulines
	printTitle TOP-CPU-USE
	ps aux | head -1
	ps aux | sort -rn -k 3,6 | head -3
	printTitle MEMORY
	free -h | head -n 2
	printTitle TOP-MEMORY-USE
	ps aux | head -1
	ps aux | sort -rn -k 4,6 | head -3
	printTitle END-MONITOR
	sleep $timeSleep
done

