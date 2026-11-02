#!/bin/bash


# =============================

## Author Name : Badhon Biswas
## Description : Creating of User Account
## Version : 1:1:1

# =============================


# Requirements:

# 1. Script Should be executed with root user or sudo user else exit with status 1 and error message
# 2. The Script will take 1st argument as user and rest will be treated as comment
# 3. Auto generate password for the user
# 4. Upon successful execution of the script, the script should display the following
#    1. Username: Badhon
#    2. password : <Random Password>
#    3. HostName : <name of the server>

## ================================

# Script should be executed with sudo/root access

if [[ ${UID} -ne 0]]
then
	echo "Please run with sudo or root user"
	exit 1
fi 