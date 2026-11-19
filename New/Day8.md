# Storage & Advanced File Systems: Disk management (⁠df⁠, ⁠du⁠, partitioning, ⁠fdisk⁠), Logical Volume Manager (LVM), and the ZFS file system.

## (78) df

The df command in Linux/Unix is used to show the disk usage & information. df is an abbreviation for "disk free"

df display the amount of disk available on the file system containing each file name argument. If no file name is given, the space available on all current mounted file systems is shown.

**Options**

- -a = --all : Include pseudo, duplicate, Inaccessible FIle Systems
- -B = --block-size=SIZE : Scale sizes by SIZE before printing them; e.g., -BM prints sizes in units of 1,048,576 bytes; see SIZE format below.
- -h = --human-readable : Print sizes in powers of 1024 (1023 M)
- H = --si : Print sizes in power of 1000 (1.1G)

```bash
# Syntax
$ df [OPTION] [FILE]

# How much disk available in our partition
$ df

# SCSI = Small Computer System Interface
# SATA = Serial Advance Technology Attachment

# Human Readable Format
$ df -h

# File System Time
$ df -T /dev/nvme0n1p1

# Mount Point
$ df -T /

# Default mount Point
$ df /dev/nvme0n1p1
$ df -h / /dev/nvme0n1p1
$ df -h / /dev/nvme0n1p1 --total

# Total Inode in the file system
$ df -ih /

```

## (79) du

```bash
# du : Disk Uses
$ du

# include all the file and directory
$ du -a

# In human readable format
$ du -ah

# ls command is show only the file size
# du command is show the block size that the file is using

# To check the size of that file
$ du -ah --apparent-size

# TO check the file size 
$ du -h *.txt 


# The long format of the size of total is
$ du -ac 

# To see the home directory
$ du /home/ec2-user

```
