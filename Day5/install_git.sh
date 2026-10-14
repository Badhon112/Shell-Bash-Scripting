#!/bin/bash

ssh <server-2> << EOF

# Getting the user ID

userID=$ (id -u)
# userID=`id -u`

# Checking the user is root or not

if [ $userID -eq 0 ]
then 
	echo "THe user has root access"
else 
	echo "You are not root users, plz run this script being root user"
	exit 1
fi 

echo "====================================="
echo "		  Install Git Package		   "
echo "====================================="

yum install git -y

# Checking the exit status

if [ $? -eq 0 ]
then
	echo "The Git package has successfully installed"
else 
	echo "The git package has not installed"
fi 

EOF