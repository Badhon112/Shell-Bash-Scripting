#!/bin/bash

# echo "Enter A Number"
a=$1

if [ $a -lt 20 ]; then 
	echo "This number is less than 20"
elif [ $number -ge 20 ] && [ $number -lt 40 ]; then 
	echo "The number is between 20 and 40"
elif [ $number -ge 40 ] && [ $number -lt 60 ]; then 
	echo "The number is between 40 and 60"
else 
	echo "The number is greater then or equal 60"
fi 