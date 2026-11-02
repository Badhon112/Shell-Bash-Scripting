## (03) ls

The linux command line has 3 parts

```bash
#  command     -options       arguments
# $  ls         -lah     (current Directory)
$ ls
$ ls -a # All the Hidden file
$ ls -l # Long listing format
$ ls -h # Human readable Format
$ ls -a -h -l # All the hidden file include long listing file and human readable file
$ ls -alh # All the hidden file include long listing file and human readable file
```

---

## (04) CD

```bash
$ ls -alh
    -> .    # The (.) dot file is the current directory file
    -> ..   # And the (..) dot dot is the parent directory file
$ ls ..     # It will show the content of the parent directory
$ ls .      # It will show the content of the current directory
$ pwd       # Print Working Directory | Present Working Directory
$ cd        # It will lead to the home directory no matter where we are
$ cd ~      # It will lead to the home directory no matter where we are
```

---

## (05) touch and mkdir

```bash
# A linux file name must be less then 255 characters
# Some special characters are not allowed
# Unix file Naming Guidelines:

# Use only lowercase a-z, 0-9, periods, underscores, and hyphens
# Unix/Linux filenames are case sensitive, so:
# myfilename.txt and Myfilename.txt are two different files

$ touch "new file1.txt"
$ touch "new\ file2.txt"

# Note : Ctrl+A will give the curser will take us to the first of the line
# Note : Ctrl+E will give the curser will take us to the end of the line


# It will create all the folder
$ mkdir -p newfolder1/newfolder2/newfolder3
```

## (06) nano and vi

```bash
nano file1.txt
> Write Something

ctrl+o, Enter , ctrl+x

$ vi index.txt

```

## (07) Viewing files (cat, more, less, head tail)

```bash

# cat mean concatenate and concatenate mean join together
$ cat file1.txt  index.txt

# show the file with the line number
$ cat -n file1.txt  index.txt

# more command will show you the line in a (%) percentage manner
$ more grocery-list.txt

# It wil show one by one
$ less grocery-list.txt

# Number of line and the percentage of the file
$ less -M grocery-list.txt

# 10 line will be default
$ head grocery-list.txt

# To see the number of the file
$ head -n 25 grocery-list.txt

# We see the 10 line grocery-list file
$ tail grocery-list.txt

# To check the live line added in the grocery-list.txt at the bottom it will show
$ tail -f grocery-list.txt


```

## (08) Output Redirection

```bash
# To stander output to a file
$ cat file1.txt > newfile1.txt

# It will override the file that content
$ cat file1.txt file2.txt >> newfile1.txt

# If there are no file in the list then to store the output of that line
$ cat file1.txt file2.txt file3.txt 1>> output.txt 2>> error.txt

# If there are no file in the list then to remove the output of that error line
$ cat file1.txt file2.txt file3.txt 1>> output.txt 2>> /dev/null

# To store the both output and the error file in same file
$ cat file1.txt file2.txt file3.txt &>> output.txt

# To print or echo the output in a file
$ echo Hello World > new.txt
$ printf "Hello World \nSecond Line \n" > new.txt


```

## (09) Moving and Renaming Files and Directories

```bash
# Absolute Path and Relative Path

# Absolute Path : specific the complete location starting from the root directory
# Relative Path : Specific the location relative to your current working directory

```
