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
