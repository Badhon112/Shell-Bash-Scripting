#!/bin/bash

echo "LEAP YEAR SHELL SCRIPTING"
echo "ENTER the year"
read year_check

if [`expr $year_check % 4` -eq 0]
then 
	echo "$year_check is a leap year"
else
	echo "$year_check is not a leap year"
fi 
