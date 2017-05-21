#!/bin/bash

# Public IP log
# Run this script inside a synchronized 
#   folder to access the public ip info anywhere.
#
# See https://github.com/kennethreitz/httpbin

if (test -e ip-public.txt)
then
		mv ip-public.txt ip-public.backup$(date +"%d%h%y_%H-%M-%S").txt
		echo 'Backing up the previous log.'
fi

while true
do
	date >> ip-public.txt
	curl http://httpbin.org/ip >> ip-public.txt 	
	sleep 60
done

