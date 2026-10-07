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
