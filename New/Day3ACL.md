# ACL

Linux file permissions have always been a cornerstone of system security, but the traditional owner-group-other model often falls short in complex multi-user environments. Enter setfacl - the powerful Access Control List utility that transforms how you manage file permissions on linux server. Whether you need to grant a developer read-only access to production files or implement fine-grained security policies.


```bash
# Install ACL support on Linux
$ Check if ACL is installed

# Install on RHEL/Centos/Rocky Linux
$ sudo dnf install acl

# Install on Debian/Ubuntu
$ sudo apt install acl

# Your File System must also support ACLs. Most modern filesystems (ext4, XFS, Btrfs) have ACL support enabled by default. You can verify this in your mount options:
$ mount | grep acl

# If ACLs are not enabled, you can enable them by adding acl to your mount options in /etc/fstab and remounting.
```

**Adding a Read-Only user to a Website with setfacl**

This is one of the most common use cases:granting a developer or auditor read-only access to website files without modifying group ownership. Lets say you have a website at /srv/www/example.com and want to give the user _sftpdev_ read-only access.

- _Lets break this down_
  - --recursive (-R) : Apply to all files and subdirectories.
  - --modify (-m) : Add or modify an ACL entry
  - The uppercase X is crucial - it grants execute permission only on directories and files that already have execute permission

- _Why use Capital X instead of Lowercase x?_
  - The Difference between x and X is critical
  - _x_ : Execute permission : Enter directory permission
  - _X_ : Execute only if already executable : Always enter directory permission

```bash
# The Simple Command
$ setfacl --recursive --modify u:sftpdev:rX /srv/www/example.com
$ setfacl -R -m u:sftdev:rX /srv/www/example.com
```

**Making ACLs Persist for New Files : Default ACLs**

Here's where many administrators make a mistake. THe command above only affects existing files. New Files created in the directory won't have the ACL, To fix this, you need default ACLs

The _d:_ prefix creates a defaults ACL that automatically applies to newly created files and directory

```bash
# To set a default ACLs in the the directory
$ setfacl --recursive --modify d:u:user:rX /directory/name
$ setfacl --recursive --modify d:u:badhon:rX /srv/www/example.com
$ setfacl -R -m d:u:badhon:rX /srv/www/example.com
```

**The complete Solution : Both Current and Future Files**

To grant read-only access that applies to both existing and future files, combinne both commands.

_The single command:_

1. Grants read-only access to all existing files and directory.
2. Sets default ACLs so new files automatically inherit the same permissions.

```bash
$ setfacl -R -m u:badhon:rwX,d:u:badhon:rwX /directory/Name
```

**Understanding setfact Syntax in Depth**

_The general syntax for setfacl is:_

```bash
$ setfacl [option] [acl_spec] file/directory
```

_ACL Specification Format_

The ACL specification _(acl_spec)_ follows this pattern:

```bash
[d:]<type>:<qualifer>:<permissions>
```

| Component     | Description                                        | Example                |
| ------------- | -------------------------------------------------- | ---------------------- |
| d:            | Option prefix for default ACLs                     | d:u:badhon:rw          |
| <type>        | u(user), g(group),o(other),m(mask)                 | u,g,m                  |
| <qualifier>   | Username,group name, or empty for file owner/group | bob,developers,(empty) |
| <permissions> | r(read),w(write),x/X (execute) - (none)            | rw,r-x,rwx             |

_Example of ACL Specifications_

```bash
# User 'alice' get read and write
$ u:alice:rw

# Group 'devteam' gets read, write, execute
$ g:devteam:rwx

# Remove all permissions for user 'bob'
$ u:bob:---

# set default ACL for group 'auditors' with read-only
$ d:g:auditors:r

# Modify the ACL mask (effective permissions limit)
$ m::rx

# ===============================================
# Essential setfacl Options Every Admin Should Know
# Recursive Operations
# ===============================================

# Apply ACL recursively to directories and files
$ setfacl -R -m u:developer:rX /var/www

# The long form
$ setfacl --recursive --modify u:developer:rX /var/www

# ===============================================
# Removing ACLs
# ===============================================

# Remove specific ACL entry
$ setfacl -X u:developer /var/www/project

# Remvoe all ACLs (restore to standard permissions)
$ setfacl -b /var/www/project

# Remove defaul ACLs only
$ setfacl -K /var/www/project

# Remove all ACls recursively
$ setfacl -R -b /var/www/project

# =============================================
# Copping ACls Between Files
# =============================================

# Copy ACLs from one file to another
$ getfacl source_file | setfacl --set-file=- target_file

# Copy ACls recursively
$ getfacl -R /source/dir > acl_backup.txt
$ setfacl --restore=acl_backup.txt

# Setting ACLs from a file
# Create an ACL specification file

# acl_config.txt
user:developer:rX
user:auditor:r
group:webteam:rwX
default:user:developer:rX
default:group:webteam:rwX

# Apply it:
$ setfacl -M acl_config /srv/www/example.com

# =============================================
# Viewing ACLs with getfacl
# =============================================

# The getfacl command display current ACls:
$ getfacl /srv/www/example.com

# Output example:
# file: srv/www/example.com
# owner: www-data
# group: www-data
user::rwx
user:sftpdev:r-x
group::r-x
mask::r-x
other::---
default:user::rwx
default:user:sftpdev:r-x
default:group::r-x
default:mask::r-x
default:other::---


# =============================================
# Understanding the Output
# =============================================

- user:: = Permissions for the file owner
- user:user_name:r-x = ACL entry for user user_name
- group:: = Permissions for the owning group
- mask::r-x = Maximum effective permissions for ACL entries
- other:: = Permissions for everyone else
- defaul:entries = Inherited by new files/directories

```

**The ACL Mask : Your Security Safety Net**

The mask entry is often overlooked but crucial. It defines the maximum effictive permissions for all ACL entries (Except the owner). Enen if you grant rwx to a user, the mask limits what's actually effective:

```bash
# setmask to read only
$ setfacl -m m::r /sensitive/file

# Now even users with 'rwx' ACL only get 'r'

# TO see effictive permissions (considering the mask):
$ getfacl /setsitive/file

# You'll see output like
$ user:developer:rwx     # Effective:r--
```

## Real-World Use Cases

1. _Development Team Access to Staging Server_

```bash
# Website root
WEB_ROOT="/srv/www/staging.example.com"

# Developers get full access. 2 team member: dev1,dev2
$ setfacl -R -m u:dev1:rwX,d:u:dev1:rwX,u:dev2:rwX,d:u:dev2:rwX $WEB_ROOT

# QA team gets read-only. qa
$ setfacl -R -m g:qa:rX, d:g:qa:rX $WEB_ROOT

# External auditor gets read-only to logs only
$ setfacl -R -m u:auditor:rX /srv/www/staging.example.com/logs
```

2. _Protecting Configuration Files_
   Allow web server to read configs but prevent accidental writes:

```bash
# Appace/Nginx needs read access
$ setfacl -m u:www-data:r /etc/myapp/config.yaml

# Developer can edit
$ setfacl -m -u:developer:rw /etc/myapp/config

# Default: no one else
$ setfacl -m o::--- /etc/myapp/config.yaml
```

3. _Shared Upload Directory_
   Multiple users can upload, but only specific users can delete

```bash
$ UPLOAD_DIR="/var/www/uploads"

# Users can read and write (Create Files)
$ setfacl -m g:uploades:rwx $UPLOAD_DIR

# But only admin can delete (via directory sticky bit + ACL)
$ chmod +t $UPLOAD_DIR
$ setfacl -m u:admin:rwx $UPLOAD_DIR

```

4. _Git Workflow : Developer Read-Only Access to Production_
   In a Git-based deployment workflow, give developers read access to verify developments without write access:

```bash
# Set Default Directory
$ Default_DIR="/srv/www/Production.example.com"

# Create the SFTP user
$ useradd sftpdev

# Grant read-only recursive access with defaults for new files
$ setfacl -R -m u:sftpdev:rX,d:u:sftpdev:rX $Default_DIR

# Verify
$ sudo -u sftpdev cat $Default_DIR/index.html # Work
$ sudo -u sftpdev touch $Default_DIR/test     # Permission denied
```

## Troubleshooting Common setfacl Issues,Security Best Practices with setfacl

1. _Principal of least Privilege_: Start with no permissions and add only what's needed

```bash
# Set the Directory
$ Sensitive_Dir="/sensitive/dir"

# Remove all access first
$ setfacl -b $Sensitive_Dir
$ chmod 700 $Sensitive_Dir

# Add specific access
$ setfacl -m u:authorized_user:rX $Sensitive_Dir
```

2. _Audit ACls Regularly_ : Create scripts to cehck ACL configurations

```bash
# Find all files with ACLs
$ getfacl -R /srv/www 2>/dev/null | grep -B3 "^user" | grep "# file".
```

3. _Document your ACLs_ : backup ACL configuration

```bash
# Backup
$ getfacl -R /srv/www > /backup/www-acls-$(date +%y%m%d).txt

# Restore
$ setfacl --restore=/backup/www-acls-20261111.txt
```

4. _Use Groups When Possible_: Easier to manage than individual user ACLs

```bash
# Create group and add users
$ groupadd webdevs
$ usermod -aG webdevs aliae
$ usermod -aG webdevs bob

# Set ACL for group instead of individuals
$ setfacl -R -m g:webdevs:rwX,d:g:webdevs:rwX /var/www
```

**setfacl vs chmod: When to Use Each**

| Feature             | chmod            | setfacl                 |
| ------------------- | ---------------- | ----------------------- |
| User supported      | Owner only       | Multiple users          |
| Groups supported    | One Group        | Multiple groups         |
| Default Inheritance | No (Use umaks)   | Yes (Default ACls)      |
| Complexity          | Simple           | More complex            |
| Compatibility       | Universal        | Requires ACl-enabled FS |
| Best for            | Simple scenarios | Multi-user environments |

## Quick Reference: Common setfacl Commands

Here a handy cheat sheet for the most frequently used setfacl operations.

```bash
# Add read-only access for a user name badhon adn the file /new/file1.txt
$ setfacl -m u:badhon:rX /new/file1.txt

# Add read/write/execute for a group name devops, and the folder directory
$ setfacl -m g:devops:rwx directory

# Add recursive read-only with directory traversal, with the user name badhon
$ setfacl -R -m u:badhon:rX traversal

# Set default ACL for new file or directory. with the username badhon
$ setfacl -R -m d:u:badhon:rX /directory

# Combined: current + default ACL in one command, directory 
$ setfacl -R -m u:badhon:rX, d:u:badhon:rX directory

# Remove specific user ACL
$ setfacl -x u:username file

# Remove default ACL only
$ setfacl -k directory

# View current ACLs only
$ getfacl dile

# Backup ACL
$ getfacl -R directory > backup.acl

# Restore ACL
$ setfacl --restore=backup.acl

# Using File Name Set the ACL

$ cat > Acl.txt << EOF
> user:badhon:rX
> group:devops:rX
EOF

$ setfacl -M Acl.txt file_name

```
