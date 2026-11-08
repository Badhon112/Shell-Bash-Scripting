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

---

## File ownership and group ownership

There are 3 Important commands

- chown : Change Owner
- chgrp : Change group
- groups : Display group memberships

## Linux group administration

1. _Check whether a group exists_

```bash

$ getent group chemistry
# Output : chemistry:x:1005:Lisa,Dan
# Structure : group_name:password:GID:members

```

2. _Create a group_

```bash
# Create a Group
# Only a privileged user can create a group.
$ sudo groupadd chemistry

# Verify
$ getent group chemistry

# Delete Group
$ sudo groupdel chemistry

# Rename A group
# Syntax : groupmod -m NEW_GROUP_NAME OLD_GROUP_NAME
$ sudo groupmod -n chemistry team

# Linux stores local group information in:
$ cat /etc/group

# Group management file location
$ sudo cat /etc/gshadow

# Group administrators with gpasswd
$ sudo gpasswd -A <UserName> <Group_Name>

# Important
# The Uppercase -A sets the complete administrator List. It does not simply append another administrator.
$ sudo gpasswd -A ec2-user,badhon chemistry

# To add a normal member:
$ sudo gpasswd -a lisa chemistry

# To remove a member
$ sudo gpasswd -d lisa chemistry

# The distinction
-A : Set group administrators
-a : Add a group member
-d : Remove a group member

```

3. _Add users to groups with usermod_

```bash

# Add Lisa to chemistry
# But there is a problem!
# -G replaces the user's supplementary group list
# If Lisa previously belonged to developers and docker, those memberships could be removed.
$ sudo usermod -G chemistry lisa

# The safer command for adding a group is:
# Here:
# -a : Append
# -G Supplementary groups
$ sudo usermod -aG chemistry lisa

# Verify
$ id lisa

# Replaces supplementary groups
$ sudo usermod -aG chemistry lisa

# Add chemistry while preserving existing supplementary groups
$ sudo usermod -aG chemistry lisa

```

## Group administrators and collaborative directories

```bash
# badhon is as assigned as administrators of the chemistry group
# What can a group administrator do?
# Badhon can manage membership of the Chemistry group without being root

# Add Ryan
$ gpasswd -a ryan chemistry

# Remove Ryan
$ gpasswd -a Ryan chemistry

# Check group membership:
$ getent group chemistry

# If the group administrator is not a Linux administrator.
# He Can't automatically
# Change system-wide file ownership
# Install software
# Modify protected system configuration
# Ran arbitrary root commands.

# Set a group password
$ gpasswd chemistry

# It prompts for a new group password
# A user who knows the password can temporarily join that group using:
$ newgrp chemistry

# Creating a shared directory
$ sudo mkdir /srv/chemistry

# Change it's group
$ sudo chgrp chemistry /srv/chemistry

# Set permissions
$ sudo chmod 770 /srv/chemistry

# Temporary group versus permanent group
# Set Password from the administrator
# Switch to administrator user
$ su badhon

# Set a password
$ gpasswd chemistry

# Switch a non group user
$ newgrp chemistry
$ ls

```

# EXAM:

## LINUX PRACTICAL EXAM: USER AND GROUP ADMINISTRATION

**Scenario**

You are a Linux system administrator. Your organization needs a shared directory for its DevSecOps team.

_User roles_

- badhon → Privileged user (sudo administrator)
- badhon1 → DevSecOps group administrator
- badhon2 → DevSecOps group member
- badhon3 → DevSecOps group member
- badhon4 → Normal user (not a group member)

```bash
# Create a Privilege User
$ root : adduser badhon
$ root : passwd badhon
$ root : usermod -aG wheel badhon

# Switch to badhon User
$ su badhon

# Create 4 User
$ sudo adduser badhon1
$ sudo adduser badhon2
$ sudo adduser badhon3
$ sudo adduser badhon4

# Add Password to every user
$ sudo passwd badhon1 # The password is the same as username
$ sudo passwd badhon2 # The password is the same as username
$ sudo passwd badhon3 # The password is the same as username
$ sudo passwd badhon4 # The password is the same as username

# Create a Group Name DevSecOps
$ sudo groupadd DevSecOps


# Check the Group exist or not
$ getent group DevSecOps

# Add badhon1 to the Group DevSecOps as administrator
$ sudo gpasswd -A badhon1 DevSecOps

# And also add the Administrator to the group Member
$ sudo usermod -aG DevSecOps badhon1

# To add a normal User while in badhon privilege user
$ sudo usermod -aG DevSecOps badhon2

# Now switch to the group Administrator User
$ su badhon1

# Add user to the group DevSecOps
$ gpasswd -a badhon3 DevSecOps


# No Create a file in the folder.
# Now this time you have to a privilege user like badhon
$ su badhon

# Create a Directory with root privilege
$ sudo mkdir /Exam/NewFolder

# Changed it to group permission
$ cd exam
$ sudo chgrp DevSecOps NewFolder

# Set the permission to the root and group permission
$ sudo chmod 770 NewFolder

# Now Switch to Group User
$ su badhon2

# Now You can create file and folder in this directory
$ cd /Exam/NewFolder
$ touch file{1..5}.txt

# Now check if you can access the file or not.
# Switch to non group user
$ su badhon4
$ cd /Exam/NewFolder
# Output :  Permission denied


# Temporary group Access
# Switch to the group administrator
$ su badhon1

# Add Group password
$ gpasswd DevSecOps


# Switch to non group user
$ su badhon4

# To access the group DevSecOps
$ newgrp DevSecOps
$ ls

# To exit out to the group
$ exit

```
