### Commands:

touch, echo, cat , > , less, more, vi, nano

ls -l

(----------)

- (-) --> File type, d - Directory, blank - Normal File, l -> Soft Link, b -> Block File. rest 9 dashes for permissions

- r - read - 4
- w - write - 2
- x - execute - 1
- a - all
- u - user
- g - group
- o - others

setuid, setgid, Sticky bit permissions

ACL - some special permissions -- setfacl, getfacl

--- -> owner or user --> r w x
--- -> group --> r x
--- -> others --> x

umask ---> permission are provided for both file as well directory

```bash
$ ls
$ tar -cvf raj.tar {ls file} # Create a file file
$ file raj.tar
$ tar -tvf tarfile.tar # To Check the list of file on the tar file
$ tar -xvf tarfile.tar -C /tmp # Extract the tar file into the tmp folder
$ du -hs raj.tar # Check the size of human readable format
$ gzip raj.tar # Create the zip file and compress the size
$ tar -xvf raj.tar.gz # Direct Unzip file from the .tar file
$ gunzip raj.tar.gz # First unzip the compress file
$ tar -xvf raj.tar -C /tmp # Unzip the file from the zip file

# There are 2 type of gzip, bzip2, bzip2 is more compression ratio than gzip

```

---

## Process Management

State of the Process

1. Running of the process
2. Sleeping / Interrupted sleep --5
3. Stopped State -- T
4. Daemon process
5. Orphan Process -- O
6. Zombie state -- Z or defunc

```bash

$ ps -aux
$ kill -9 id
$ kill -l
$ kill -19 id


```

---

# New

## Pipes

- Pipes - Pipes are circular buffer memory which is used to communicating between 2 commands. Pipes is the intercommunication between 2 command. Pipes are used for filtering the output

- cmd1 | cmd2

- So the output of the first command will be given as input for 2nd command via the pipe

- _Data Channel_
  - 0 = Stdin = Keyboard
  - 1 = stdout = screen / terminal / monitoring
  - 2 = stderr = screen / terminal / monitoring

```bash

$ less hello.txt # Page wise manner
$ more hello.txt # Full text
$ head hello.txt # First 10 Line of File
$ head -15 hello.txt # First 15 Line of File
$ tail hello.txt  # Last 10 line of File
$ tail -15 hello.txt  # Last 15 line of File

```

_Example_

```bash
$ ps -ax | less
$ cat file1 | sort # See in alphabetic order
$ cat file1 | sort -r # See in alphabetic order reverse sort
$ df -h | sort -rnk5 # Reverse sort in column number 5
$ df -h | awk '{print $1, $5}' | sort -r # See only 1 and 5 column in reverse order
$ cat file.txt | uniq # Do not repeat the same word
$ cat file.txt | sort | uniq
```

---

## Redirection Operators

```bash
# > = Replace the data override
# >> = Will always append the output

# < = Input redirect operator
# << = Here operator

# 2> --> Redirecting the error to the error file
---

$ ls > file1 # Store the output to the file1
$ date > file1 # Override the Data
$ date >> file1 # Will always append the output

---

# 1      3       5
# Line  Word Character
$ wc
$ wc -l < file1.txt # Check the Line of the Code
$ wc -w < file1.txt # Check the word of the Code
$ wc -c < file1.txt # Check the Character of the Code

---

# Error File Content all the line of the error
# 2 Mean Stander Error
$ error-command 2 > error-file.txt


---
# To run a command in Background
$ ls &

---

$ pts/0 # virtual terminal , pseudo terminal
$ tty # Virtual terminal, but we even call it as text terminal

# By default linux os provided 6 text terminal and 255 pseudo terminal

# Text terminal. When you are physically login to the server then you get this text terminal
# /dev/tty1, tty2, tty3, tty4, tty5, tty6

# pseudo terminal. When you connect the server through ssh, or any other medium then you get pseudo terminal
# /dev/pts/0, /dev/pts/1 ... /dev/pts/255


---

# EOF = End Of File
$ sort << EOF
hello
Hello
EOF

```

---

## Package Manager

- Package Manager for Redhat/Centos/Fedora
  - --> yum based package manager
    - --> RPM (Redhat Package Manager)

YUM - Yellow-Dog Modified

Package Management Tools:
yum
dnf
rpm

Ubuntu:
apt

We are using these commands for Installing, Upgrading, Deleting, View the package info and also the package configuration

Yum is the primary package management tool for redhat
Yum perform the dependency resolutions when installing, updating, removing the packages
Yum can also manager packages from installed repositories in the system or from .rpm packages.

```bash


```
