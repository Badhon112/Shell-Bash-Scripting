#!/bin/bash

ls
for each_file in $(ls *.txt)
do
	echo $each_file
done 