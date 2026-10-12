## Find

find = search for files in a directory hierarchy

```bash
# Find Syntax
$ find /path/ -name <file_name>

# Search file with the name of a123
$ find . -name file1.txt

# search the size fo that file
$ find / -size 50M

# Normal files, such as .txt, .jpg, .sh, and .log.
$ find . -type f

# Devices that handle data character by character, such as terminals.
$ find . -type c

# Devices that handle data in blocks, such as hard drives.
$ find . -type b

# A special file used for communication between processes.
$ find . -type p
```
