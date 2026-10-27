# Day 6

if Condition
miscellanous things

if [condition]
if [[condition]]

variables / special symbols

#! ---> she bang

#!/usr/bin/env bash

---

## Variable

label = some value
user defined variables
environment variables

centos/RHEL --> /usr/bin/bash /bin/bash

```bash
$ declare y=20

```

---

```bash
#!/bin/bash

s="Bash Shell Scripting"
echo "Welcome to $s"
echo "$s is a powerFull linux bash Language"
echo "We are working with variable concept of $s"
```

_Variable_ : variables are useFull to store the data in shell scripting and later we can use them if required. Should it not be any space between declare variable

simple variable : x=4
Default value of a variable is empty/nothing

- _System variables_
  - these variable are created by the OS Itself
  - All these variables are defined in CAPITAL LETTERS
  - echo $TABTAB
  - we can check them using set command. "$set "
  - Examples: $HOME, $USER

- _User Defined Variables_
  - Create and maintained by user. This type of variables are always in lower letters.
  - But we can even take combination of user and lower case letters.

Variables Name should always contains only a-z A-Z 0-9 or \_ characters
$@

variable Name length should be less or equal to 20 characters.

We can store the output of a command into a variables as follow

- var1=$(command)
- var2=`command`

We can assign one variables value/data into another using
Name="Shell Scripting"
NewName=$Name
NewName=${Name}

Check The OS

```bash
$ cat /etc/os-release
```

---

Simple shell script to practice with variables
Q1. Print Docker status and Docker version

```bash
#!/bin/bash

dockerStatus=$(systemctl status docker | awk '/Active/ ${print $3}' | tr -d "[()]")
dockerVersion=$(docker -v | awk '/version/ {print $3}' | tr -d ",")

echo "The Docker status is: $dockerStatus"
echo "The Docker version is: $dockerVersion"
```
