#!/bin/bash

echo "The Below output is for \$*"
for each in "$*"
do
	echo $each
done 

echo "The below output is for \$@"

for each in "$@"
do
	echo $each
done 