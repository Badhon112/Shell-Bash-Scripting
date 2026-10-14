#!/bin/bash

# Author: Badhon Biswas / Date - 14-10-2026
# Description: If else Condition used for test purpose
# Usage:

echo "Enter the 1st Integer"
read a
echo "Enter the 2nd Integer"
read b
c=30

if test $(($a + $b)) -eq $c
then 
    echo "The integer is equal"
else
    echo "The integers are not equal"
fi