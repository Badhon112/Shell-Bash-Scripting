#!/bin/bash

clear

read -p "Enter file Extension : " ext

case $ext in
	".txt" )
		ls -lrt *.txt
		;;
	".sh" )
		ls -lrt *.sh
		;;
	* )
		echo "Sorry!!.. You have entered a invalid file extension"
		;;
esac