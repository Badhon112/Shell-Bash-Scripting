#!/bin/bash

Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
Reset=$'\e[0m'


while true
do
	# echo -e "${Blue}${date +%T}${Reset}"
	echo -e "${Blue}$(date +%T)${Reset}"
	sleep 1;
	clear;
done