#!/bin/bash

for each in $(seq 1 100)
do
    if (( each % 2 == 0)) then
        echo "This is an even number, And the Number is ${each}" 
    fi 
done 