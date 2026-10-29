#!/bin/bash

for host in $*
do
	ping -c3 $host &> /dev/null
	if [[ $? = 0 ]]
	then
		printf "%-30s is alive \n" $host 
	else
		printf "%-30s is not alive \n" $host 
	fi
done 