#!/bin/bash

# for each in 1 2 3 4 5 
# do 
# 	echo "Hello badhon Biswas"
# done


for each in *.sh
do 
	if [[ -x $each ]]
	then
		echo "$each is having execute permission"
	else
		echo "$each is not having execute permission"
	fi 
done 