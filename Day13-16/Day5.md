# Backup & Job Scheduling: Archiving (⁠tar⁠, ⁠rsync⁠) and automating tasks with ⁠cron⁠, ⁠anacron⁠, and ⁠systemd⁠ timers

## (46) gzip

```bash
# Create a file with some content
$ cat > File1.txt << EOF
... Some Content
EOF

# To compress a file in linux
$ gzip File1.txt

# Output
-> Output : file1.txt.gz

# To view the file in the Gzip format
$ zcat file1.txt.gz


# To find a text in Gzip
$ zgrap Find_text file1.txt.gz

# To decompress a gzip file
$ gzip -d file1.txt.gz

# Other way to decompress a gzip file
$ gzip file1.rxt
$ gunzip file1.txt.gz

# TO create a zip file without changing the main content
# Create a new file with
# -K : It is used for keep the file its work on gzip and gunzip.
$ gzip -k file1.txt

# From the zip file to create a new file
$ gunzip -k file1.txt.gz
$ gzip -dk file1.txt.gz

# Create a multiple Zip file
$ gzip file1.txt file2.txt
$ gzip -k file1.txt file2.txt

# From the zip file unzip the file
$ gunzip -k file1.txt.gz file2.txt.gz
$ gzip -dk file1.txt.gz file2.txt.gz

# To check how many % has been reduces to this file
$ gzip -v -k file1.txt

# To add a compression level
$ gzip -v1 file1.txt

# Compress all the file in a directory
# -r : Recursively
$ gzip -r dir_name
$ gunzip -r dir_name

# if we want to gzip a file into a new file_name
$ gzip -c file1.txt >> file1.bak.gz

```

## (47) tar

```bash
# tar is the short form tape archive
# tar file syntax
$ tar -cvf [Destination] [Source]

# To create a tar file
$ tar --create --file=backup.tar File1.txt File2.txt

# To create a tar file with verbose mode
$ tar --create --verbose --file=backup.tar file1.txt file2.txt file3.txt

# To create a tar file more specific
$ tar -cvf backup.tar file1.txt file2.txt file3.txt file4.txt file5.txt File1.txt File2.txt

# To add a directory
$  tar -cvf backup.tar file1.txt newdir

# To check what inside the tar file
$ tar --list --file=backup.tar
$ tar -tf backup.tar
$ tar -tvf backup.tar

# To extract the tar file
$ tar -xf backup.tar

```

## (48) tar part 2

```bash
# tar extract will override the file content if the file is present both in tar format and file format
$ cat > file1.txt << EOF
This is the File Number1
EOF

# Create a tar file
$ tar -cvf backup.tar file1.txt

# Now Change something in the File1.txt
$ echo "This is new line" >> file1.txt
$ cat file1.txt

# Now un_tar the file
$ tar -xf backup.tar

# now check the file
$ cat file1.txt

# If the file already exists in local file but we don't want to changed it.
# keep the existing file as it is and un_tar the file that has been deleted
$ mkdir newfolder
$ cd newfolder
$ touch file{1..10}.txt
$ cd ..
$ tar -cvf backup.tar newfolder/
$ cd newfolder
$ rm file1.txt file2.txt
$ cd ..
$ tar -xkf backup.tar

# To extract a specific file from the tar file
$ tar -xvf backup.tar file1.txt

# To absolute path
$ tar -xvf backup.tar -C /newfolder

# to update a specific file in to tar file
$ tar -uvf backup.tar file1.txt

# to append a specific file in the tar file
$ tar -rvf backup.tar file1.txt

```

## (49) bzip2 xz zip tar files

```bash
# bzip2 as zip

$ cat > file1.txt << EOF
lorem ipsum 30
EOF

# To create a bz2 file
$ bzip2 file1.txt
# -> file1.txt.bz2
# To view the content in the bzip2 file
$ bzcat file1.txt.bz2

# To grep some command
$ bzgrep lorem file1.txt.bz2

# To unzip a bz2 file
$ bunzip2 file1.txt.bz2

# We can make a zip file using .xz
$ xz file1.txt

# Decompress the file
$ xz -d file1.txt.xz
$ unxz file1.txt.xz

# in tar file while creating the tarfile we can tell the  tar to create a bzip2 file
$ tar -cvjf backup.tar file_list

# for xz
$ tar -cvJf backup.tr file_list

# TO check how many time it take to format this gip file
$ time tar -cvf backup.tar file_list

```

## (50) zip and 7zip

```bash
# To zip a file
$ zip backup.zip file1.txt file2.txt

# To zip a directory
$ zip -r backup.zip new_folder

# we can see what inside the zip file
$ zipinfo backup.zip
$ zip -sf backup.zip # sf = Show Files
$ unzip -l backup.zip
$ less backup.zip

# To unzip a zip file
$ unzip backup.zip

# To unzip file in a folder
$ unzip bkup.zip -d Zipx_2

```

## (51) rsync

```bash
# rsync stand for remove sync. it can be sync file from one computer to another. rsync can be used to sync from one directory to another

# Syntax
# rsync source destination

$ rsync -v Rsync1/file1.txt Rsync1/

# To sync both folder
$ rsync -Rv Rsync1 Rsync2
```
