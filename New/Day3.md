# Permissions & Groups: Understanding file permissions, ownership, groups, ACLs, and file attributes

## (21) File and Directory Permissions

The permission column is broken up into four sections

1.  _Type of file:_
    - "d" for directory
    - "-" for file
    - "I" for Link

2.  _User/Owner Permissions_
    - "r" for read
    - "w" for write
    - "x" for execute

3.  _Group Permissions:_
    - "r" for read
    - "-" Can't write
    - "x" for execute

4.  _Other Permission:_
    - "r" for read
    - "-" Can't write
    - "x" for execute

![File and Directory Permissions](./Images/Day3/1.png)

```bash
# Change the File Permission
$ chmod 777 file1.txt

# Read        Write       Execute         No Privilege
#   4           2             1               0

# The Read Privilege has a value of 4
# The Write Privilege has a value of 2
# The execute Privilege has value of 1
# No Privilege has a value of 0
```

## (22) File OwnersShip (chgrp)

<!-- Permissions & Groups: Understanding file permissions, ownership, groups, ACLs, and file attributes -->

_What is chgrp?_
Well 'chgrp' stands for change group, and its a command in Linux that allows you to modify the group ownership of files and directories. It as important tool for managing permissions and ensuring the right users have access to the files

```bash

# Syntax:
# chgrp [option].. [GROUP_NAME] [Directory/FILE_NAME]....

# Change the Group OwnerShip ec2-user
$ sudo touch file1.txt
$ sudo chgrp badhon file1.txt

# To find what group my userid has
$ groups

# If we want to what group of the user is
$ groups badhon

#

```
## (23) Groups Part 2