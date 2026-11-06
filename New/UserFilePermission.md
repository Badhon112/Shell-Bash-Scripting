# User Management & File Permissions

## System Level Command

```bash
# Check which linux distribute system are we in
$ uname

# Check the uptime of tha system
$ uptime

# Check how many user has login to the system or this server
$ who

# Current Logged In user in the system
$ whoami

# To find out which file the function code has been executed
$ which bash
$ which cp

# To check out the Id of that user
$ id badhon

# sudo 

# It will Power off the system
$ sudo shutdown

# To restart the system
$ sudo reboot

```

## User & Group Management Commands

```bash

# Add a user 
$ sudo useradd -m badhon

# Add passwd for user badhon
$ sudo passwd badhon

# Delete the user specify Information
$ sudo userdel badhon

# Create some user for the group
$ sudo adduser 1
$ sudo adduser 2
$ sudo adduser 3
$ sudo adduser 4

# Create a group
$ sudo groupadd devops
$ cat /etc/group

# Adding user to the group
# Syntax
$ sudo gpasswd -a <User_Name> <Group_Name>

$ sudo gpasswd -a 1 devops
$ cat /etc/group

# Adding multiple user to the group
# Syntax
$ sudo gpasswd -M <User1>,<User2>,<User3> <Group_Name>
$ sudo gpasswd -M 2,3,4 devops 

# Delete the Groups
$ sudo groupdel tester

```