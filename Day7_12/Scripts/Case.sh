#!/bin/bash

clear
read -p "Enter Number 1 : " a
read -p "Enter Number 2 : " b
echo "==============================================="
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "==============================================="
read -p "Enter Your option (1-4) : " opt

case $opt in
	"1" ) 
		echo "You are calling the Sum"
		echo "And the sum is $((a+b))"
		;;
	"2" )
		echo "You are calling the Subtraction"
		echo "And the Subtraction is $((b-a))"
		;;
	"3" )
		echo "You are Calling the  Multiplication"
		echo "And the Multiplication is $((a*b))"
		;;
	"4" )
		echo "You are Calling the  Division"
		echo "And the Division is $((b/a))"
		;;
	* )
		echo "Unknown Character"
		;;
esac