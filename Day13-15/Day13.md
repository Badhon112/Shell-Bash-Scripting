## Day 13 - Day 15

29/10/2026

---

Positional Parameters, Concepts of Array, Functions, cronjob, Working with remote Servers.

---

## Positional Parameters

Positional parameters - Whenever the script is executing, you need to pass some argument or parameters, then you be using these positional parameters
$0, $1, $2, $3, $#, $\*, $@.

to Check the shell type in the OS

```bash
$ cat /etc/shells
```

_position.sh_

```bash
#!/bin/bash

echo "The script name is $0"
echo "The 1st positional parameter is $1"
echo "The 2nd positional parameter is $2"
echo "The 3rd positional parameter is $3"
echo "The total positional parameter are $#"
echo "All positional parameters are $*"
echo "All positional parameters are $@"
```

```bash
# Run This script using this
$ sh position.sh 10 20 30
```

---

## Array

1. What is an Array?
   - Array is the data structure of the bash shell, which is used to store multiple data's .
   - Simple Array = $ myarray=(5 6 7 8 "badhon")
   - There is no Limit for array length.

2. How to define Array?
   - There are different way to define an array in bash
   - Empty arrays myArray=()
   - mycards = (ls pwd 2.5)

3. How to access Array values?
   - Basically, bash shell array is a zero-based array --> indexing start from 0
   - for eg: myarray=(23 4 5 15 7)

```bash
#!/bin/bash

myarray=(1 3 5 7 9)

echo "First element: ${myarray[0]}"
echo "Second element: ${myarray[1]}"
echo "All elements: ${myarray[@]}"

echo "Array indices: ${!myarray[@]}"
```

4. Different types of Array?
   We have 2 types of arrays?
   1. Index Based Array or Arrays
   2. Associative Array

5. How to store the command output into an Array?

6. How to delete and update existing array with new values?
7. How to read array using read command?

```bash

$ myarray=(5, 6, 7, "badhon")
$ mycmds=("ls -lrt", "hostname -s")

$ myarray1=(1 2 3)
$ echo "${myarray1[@]}"

$ read -a my_new_array
    1 2 3 4 5 6 7 8 9 10
$ echo "${my_new_array[*]}"


```

### Associative Arrays

Associative Arrays are the arrays with index values as strings

Generally, we don't have to declare normal arrays before using them, but we have to declare Associative arrays before using them

declare -A myassoarray

myassoarray=([name]="bash shell Scripting" [version]:4.2)
Associative Array as key value pair

myassoarray[name]="Bash Shell Scripting"
myassoarray[version]=4.3

---

## For Loop

Basic for loop:

for variable in list_of_values
do 
    command1
    command2
done

