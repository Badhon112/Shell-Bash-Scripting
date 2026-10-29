#!/bin/bash

# Author - Badhon Biswas
# Purpose - Install Multiple Package

if [[ $(id -u) -ne 0 ]] ; then
	echo "Plz run from root user or with sudo previlege"
	exit 1
fi

if which vim &> /dev/null
then	
	echo "Already vim is installed"
else
	echo "Install vim package...."
	yum install vim -y &> /dev/null 
	if [[ $? -eq 0 ]]
	then
		echo "Successfully installed vim pkg"
	else 
		echo "Unable to install vim pkg"
	fi 
fi