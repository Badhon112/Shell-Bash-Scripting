## Disk Management

**Storage**

- _Types of Disk_
  - SATA Disk
  - PATA Disk
  - Virtual Disk

1. _SATA Disk_

- Disk 1 : `/dev/sda`
  - `/dev/sda1` (Partition 1)
  - `/dev/sda2` (Partition 2)
- Disk 2 : `/dev/sdb`
  - `/dev/sdb1` (partition 1)
  - `/dev/sdb3` (Partition 2)

2. _PATA Disk_

- Disk 1: /dev/hda
  - /dev/hda1
  - /dev/hda2
- Disk 2: /dev/hdb
  - /dev/hdb1
  - /dev/hdb2

## 3. Virtual Disk : Partition Type

1.  _Primary Partition_
    - We can create maximum 4 Primary Partition into a single Disk

2.  _Extended Partition_
    - If we Required more then 4 Partition then we can create Extended partition into s single Disk

3.  _Logical Partition_
    - When we Create Logical Partition then it take Space From Extended Partition.It Always Start From Partition Number 5.

4.  1.  _Show Available Hard Disk List_

```bash
# Show the Available Disk
$ lsblk

# Show the Available Disk in long Format
$ fdisk -l
```

4.  2. Create New Partition

```bash
# Option
# n : Create new Partition
# d : Delete Partition
# P : Print the Partition
# t : Changed Type of partition
# l : Show List type of Disk
# q : Quite
# w : Save And Exit

# Create new Partition
$ fdisk /dev/sdb
$ n
$ Enter , Enter,

# create a new Partition of 1 GB
$ +1G

# Print Out the partition
$ p

$ w
# Save and it will create a new partition

# If There are 3 partition is already created then It will create a Extended Partition of full memory size

```

## Linux File System

- ext
- ext2
- ext3
- ext4
- xfs

```bash
# For Kali
$ sudo apt install xfsprogs -y

# 1. Create a partition
$ fdisk /dev/sdb

# 2. Create File System on New Create partition
$ mkfs.xfs /dev/sdb1

# 3. Mount partition on any Directory (Temporary)
$ mkdir /data1
$ mount /dev/sdb1 /data1

# 4. Mount partition Permanently
$ vim /etc/fstab
-> /dev/sdb1 /data1 xfs default 0 0
```

---

## LVM (Logical Volume Manager)


