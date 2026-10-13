# Find & Grep

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

---

## Find

Find command search for files in a directory hierarchy

_Example_

```bash
# find command syntax
$ find [options] [path..] [expression]


$ find /path/ -name <file_name>
$ find . -name a123

```

**_Case 1_**

How to search a file based on their size?

- M for (MB), K for (KB), G for GB, c for (bytes)

_Example_

```bash
# command syntax
$ find /path/ -size 50

$ find . -size 50M
```

**_Case 2_**

How to find only file or only directory in a given path?

- f for file, d for directory, l for symbolic link.
- b for block device, s for socket

_Example_

```bash
# command syntax
$ find /path/ - type f
$ find . -type l
$ find . -type d

```

**_Case 3_**

How to search a file based on it's name?

_Example_

```bash
# command syntax
#  find /path/ -name <file_name>

$ find . -type file1.txt
```

**_Case 4_**

How to ignore upper & lower case in file name while searching files?

_Example_

```bash
# command syntax
$ find /path/ -iname <file_name>

$ find . -iname File1.txt
```

**_Case 5_**

How to search files for a given user only?

_Example_

```bash
# Command Syntax
$ find /path/ -user root

$ find . -user root
```

_**Case 6**_

How to search a file based on the inode no.?

```bash
# Command Syntax
$ find /path/ -inum <inode_no_of_file>

$ ls -li
$ find . -inum 40
```

_**Case 7**_

How to search a file based on the no. of links?

```bash
$ find /path/ -link <no_of_Link>

$ find . -link 1
```

**_Case 8_**

How to search a file based on their permissions

```bash
$ find /path/ -perm /u=r
$ find /path/ -perm 777

$ find . -perm 644
```

**_Case 9_**

How to search all the files which start with letter a?

_Example_

```bash
$ find /path/ -iname a*

$ find . -iname "f*"
```

**_Case 10_**

How to search all the files which are modified/created after last.txt file?

```bash
$ find /path/ -newer last.txt

$ ls -ltr
$ find . -newer ./hello/file1.txt
```

**_Case 11_**

How to search all the empty files in a given directory

```bash
$ find /path/ -empty
```

**_Case 12_**

How to search all the empty files in a given directory and at the same time delete them

```bash
$ find /path/ -empty -exec rm {} \;
$ find . -empty -exec rm {} \;
```

**_Case 13_**

How to search all the files whose size are between 1-50 MB?

```bash
$ find /path/ -size +1M -size -50M
```

**_Case 14_**

How to search 15 days old files?

```bash
$ find /path/ -mtime 15
$ find . -mtime 15
```

---

## Grep

Global Regular Expression Print

Grep command search for a particular string/keyword from a file and print lines matching a pattern.

It check line by line and print lines matching given pattern.

We can use grep anywhere like with files searching for file, directories etc

grep command syntax

```bash
$ grep [option].. Pattern [file]..

# Give the full line where badhon word there
$ grep badhon file1.txt


# Case 1
# To ignore the upper and lower case while searching
$ grep -i "keyword" file
$ grep -i "badhon" file.txt


# Case 2
# To search everything except given pattern/keyword
$ grep -v "keyword" file
$ grep -v "badhon" file


# Case 3
# To print how many times (count) given keyword present in file
$ grep -c "keyword" file
$ grep -c badhon file1.txt


# To search for exact match of given keyword in a file
$ grep -w "keyword" file
$ grep -w badhon file1.txt

# To print the line no. of matches of given keyword in a file
$ grep -n "keyword" file
$ grep -n "badhon" file

# To search a given keyword in multiple files || All file that content
$ grep "keyword" file1 file2
$ grep "keyword" file1 file2
$ grep "badhon" *

# To search multiple keyword in a file
$ grep -e "badhon" -e "Biswas" file1.txt
$ egrep "Badhon|Biswas|Software" file1.txt


```

