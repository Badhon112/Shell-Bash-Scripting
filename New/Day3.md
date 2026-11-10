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

```bash
# Check the Sudo Group and check the Privilege user
# if its a aws Linux then
$ getent group sudo
$ getent group Wheel

# Create a new Group
$ sudo groupadd team
$ sudo groupadd deleteme


# Check the Group User
$ getent group <GroupName>
$ getent group team
$ getent group deleteme


# Delete Group
$ sudo groupdel deleteme

# Change the group name devops to devsecops
$ sudo groupadd devops
$ getent group devops
$ sudo groupmod --new-name devsecops devops
$ sudo groupmod --new-name <Group New Name> <Group Name>


# Display the groups
$ cat /etc/group

# just like etc shadow group we have group shadow file
$ sudo cat /etc/gshadow

# to add a group administrator in the group
$ sudo gpasswd -A <UserName> devsecops
$ sudo gpasswd -A <UserName>,<UserName> devsecops

# Adding the user in the group
$ sudo usermod -G <GroupName> <UserName>
$ sudo usermod -a -G <GroupName> <UserName>

$ sudo cat /etc/gshadow


---
# OK
# So if you want to add the administrator to a group
# 1. First You need to login to a privilege user In this case its ec2-user or root
# 2. First You need to a Privilege User
# 3. Its better to give a group administrator to make privilege user
$ sudo adduser badhon
$ sudo passwd badhon
$ sudo usermod -a -G wheel badhon

# Create a Group
$ sudo groupadd devops
$ sudo gpasswd -A badhon devops

# Now if you want to add user services user
$ sudo adduser biswas
$ sudo passwd biswas
$ sudo groupadd -a -G devops biswas

# The output will be
# badhon will be group administrator
# biswas will be services user
$ devops:!:badhon:biswas


# Check the group Information
$ cat /etc/group
$ sudo cat /etc/gpasswd

```

## (24) Groups pt2

```bash

# Group Administrator can add or delete a user in the group
# Switch to the administrator user in this case its badhon
$ su badhon

# Create a user
$ sudo adduser biswas1
$ sudo passwd biswas1

# Add the user to the Group
$ gpasswd -a biswas1 devops

# The Output will be
$ cat /etc/group
$ getent group devops
    -> devops:x:1004:biswas,biswas1

# Delete a user in the Group
$ gpasswd -d biswas1 devops

# Administrator User can also set group passwd
$ gpasswd devops

# Create a file in the root
$ sudo mkdir /srv/devops

# Change the group permission to devops
$ sudo chgrp <GroupName> <File_Name>
$ sudo chgrp devops devops

# Give only the permission for the group and the root user
$ sudo chmod 770 devops


![File ownership and group ownership](./UserFilePermission.md)

```

## (25) setUID, Sticky Bit, setGID

**Sticky Bit**
No one can delete the content of the directory except the Owner

- Group - Linux
- Members - Rohit, Virat and Saurabh
- Directory - Dir
- Group Permissions - read, write and execute
- Every member of Linux Group can create and delete files wihtin directory DIR
- Rohit can delete (intentionally/Unintentionally) files created by Virat and vice-versa

```bash
# Login as a privilege user
$ su badhon

# Add 3 User
$ sudo adduser badhon1
$ sudo adduser badhon1
$ sudo adduser badhon1

# Add 3 Password
$ sudo passwd badhon1
$ sudo passwd badhon2
$ sudo passwd badhon3

# Make a group
$ sudo groupadd devops

# Assign the user th this group
$ sudo usermod -aG  devops badhon1
$ sudo usermod -aG  devops badhon2
$ sudo usermod -aG  devops badhon3

# Create a folder for this group and group Permission to the group
$ sudo mkdir /New/Folder
$ sudo chgrp devops /New/Folder

# check the Group and user has been assign or not
$ cat /etc/group

# Now set the permission to the group devops
$ sudo chmod 770 /New/Folder

# Now Try to login a group user, and check you can create a folder or not
$ su badhon1
$ touch file{1..4}.txt


# Now to apply Sticky Bit Just apply
$ su root
$ chmod 1770 /New/Folder

# Now the user can't delete other user file
# Check
$ su badhon1
$ ls -alh
-> drwxrwx--T.  2 User Group  73 Nov  9 07:01 newfolder
$ rm badhon2.txt
# Permission Deny
```

**setGID**

Group OwnerShip will be inherited to all the content of the directory

```bash
# Change the group Owner
$ chmod g+s common

# Change the group owner every time they created a file
$ ls -alh
-> -rw-r--r--. 1 badhon2 devops   0 Nov  9 07:16  badhon2.1.txt

```

**setUID**

setuid is a permissions bit flag, when the setuid bit flag is set, it allows the users to run an executable with the permissions of the file owner

```bash


```

## (25.1) setUID, Sticky Bit, setGID

Normal Linux Permissions have 3 basic permission types:
r = Read, w = Write, x = Execute

_Linux also provides special permission bits._

| Special Permission | Octal Value | Main Purpose                                                                                |
| ------------------ | ----------- | ------------------------------------------------------------------------------------------- |
| SUID               | 4           | Execute a program with the ,file owner effective UID                                        |
| SGID               | 2           | Execute a program with the group effective GID; on directories, inherit the directory group |
| Sticky bit         | 1           | Restrict deletion of directory entries                                                      |

**SUID**

SUID Stands for Set User ID.
It is a special permission that can be applied to executable files.

The Program can perform operations using the owner privileges, subject to the program's implementation and security checks.
_Important_ SUID does not automatically make the user root. It only changes the effictive identity of that executable while it run.

The Normal user can't modify the file . but can access the file in SUID

The special permission for the user

A file with SUID set always executes as the user who owns the file, regardless of the user executing the command.
show as 's' or 'S'.

How to set/unset Suid

```bash
$ chmod u+s <file_name>
$ chmod 4770 <file_name>
$ chmod u-s <file_name>
$
```

```bash
## Here to use SetUID
## Lets say a admin or Privilege user create a file with some bash script. Now the admin or the privilege can execute the program file. Now for a normal user can he execute the file. Yes he can If he enable the setUid. SetUid enable every user to execute the file with execute with the admin or Privilege user.
# Example:

# Switch to the root/admin/privilege user
$ su badhon # badhon is a privilege user

# Now Create a file named digital clock.
$ vim digital_clock.sh

#!/bin/bash
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'
Reset=$'\e[0m'


while true
do
	# echo -e "${Blue}${date +%T}${Reset}"
	echo -e "${Blue}$(date +%T)${Reset}"
	sleep 1;
	clear;
done

# Now make it executable. And run the command
$ chmod 755 digital_clock.sh
$ sh digital_clock.sh

# Now set the permission to setUID
$ chmod 4755 digital_clock.sh

# Now it will be better to set this in alias
$ alias Digital_Clock="sh /home/badhon/digital_clock.sh"

# Now switch to the services user
$ su badhon2
$ alias Digital_Clock="sh /home/badhon/digital_clock.sh"
$ Digital_Clock

```

**SGID**

SGID stands for Set Group ID.

It is similar to SUID, but instead of changing the effective user identity, it changes the effective group identity.

---

SetGID -sgid

Group Ownership will be inherited to all the content of the directory

E.g. :

```bash
$ chmod g+s DIR
```

---

## (26) ACL = Access Control List

**setfacl/getfacl**

- Applying fine-grained permissions on files and directories
- getfacl and setfacl command

- _Permission Flags_
  - r = read
  - w = write
  - x = execute
  - (-) = Permission is absent
  - X = means execute is set on directories and not regular files (unless the files already has execute permission)

- _View ACL_
  - ls -l : shows minimal ACL
  - (+) : means ACL is set
  - _user_ : shows user ACL settings, which are same as standard user file settings, and not the group-owner settings.
  - _group_ : shows current ACL mask settings, and not the group-owner settings.
  - _other_ : shows other user ACL settings, which are same as standard other file settings

```bash
# Command
$ getfacl <File_Name>

$ getfacl file1.txt


# Set ACL
# -m : to add or modify ACL
$ setfacl -m u:user_name:user_permissions filename
$ setfacl -m u:badhon1:--- file1.txt
$ setfacl -m g:group_name:group_permission folder_name/

```

## (27) ACL = Advanced Permission - recursive, default, deleting

- _What is ACL?_
  - Access control List (ACL) provides an additional, more flexible permission mechanism for file systems, it is designed to assist with UNIX file permissions, ACL allows you to give permissions for any user or group to any disc resources.

- _Use of ACL_
  - Think of a scenario is which a particular user is not a member of group created by you still you want to give some read or write access, how can you do it without making user a member of group, here comes is picture Access Control Lists, ACL helps us to do this trick
- Basically ACLs are used to make a flexible permission mechanism in Linux
- From Linux man pages, ACls are used to define more fine-grained discretionary access right for files and directories
- Commands to assign and remove ACL permissions are:
  - _setfacl and getfacl_

List of commands for setting up ACL:

```bash
# 1. To add permission for user
$ setfacl -m u:user:rwx /path/to/file

# 2. To add permissions for q group
$ setfacl -m g:group:rw /path/to/file

# 3. To allow all files or directories to inherit ACL entries from the directory it is wi thin
$ setfacl -Rm "entry" /path/to/dir

# 4. To remove a specific entry
$ setfacl -x u:user /path/to/file  # (For a specific user)

# 5. To remove all entries
$ setfacl -b path/to/file # (For al users)

# Note:
# As you assign the ACL permission to a file/directory it adds + sign at the end of the permission
# Setting w  permission with ACL does not allow to remove a file

# Step 1: Set file permission to users on a specific file
$ setfacl -m u:kali:rw- file.txt

# Step 2: Set the permission to user for multiple files and directory
$ setfacl -m u:kali:rx file1.txt file2.txt d1

# Step 3: Deny all permission on a Specific directory
$ setfacl -x u:kali d1

# step 4: Display the file access control List
$ getfacl -a f2.txt

# Step 5 : Display the default access control list
$ getfacl -d f2.txt

#
```

## New ACL

```bash
# Install ACL support on Linux
$ Check if ACL is installed

# Install on RHEL/Centos/Rocky Linux
$ sudo dnf install acl

# Install on Debian/Ubuntu
$ sudo apt install acl



```

---
