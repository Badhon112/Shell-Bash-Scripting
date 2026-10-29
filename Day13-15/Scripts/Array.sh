#!/bin/bash

myarray=(1 3 5 7 9)

echo "First element: ${myarray[0]}"
echo "Second element: ${myarray[1]}"
echo "All elements: ${myarray[@]}"

echo "Array indices: ${!myarray[@]}"