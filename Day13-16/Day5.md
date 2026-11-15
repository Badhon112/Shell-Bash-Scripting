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


$ tar --create --file=file1

```
