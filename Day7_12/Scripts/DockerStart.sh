#!/usr/bin/env bash

read -p "Do you wnat to start Docker ? say yes or no : " userconf

# if [[ "$userconf" == "yes" || "$userconf" == "y" ]]
# if [[ "$userconf" == "yes" -o "$userconf" == "y" ]]
if [[ "$userconf" =~ yes|y|Y ]]
then
	echo "Docker Start"
else 
	echo "Skipping the Docker Start ....."
	exit 1
fi 