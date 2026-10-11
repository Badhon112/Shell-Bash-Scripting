## sed and awk command

## sed = stream editor

_sed_ = stream editor
file1 --> there are many line in the files. change some particular word, cat dog. Replace the String.
100 files, i want to delete 1,15 --> sed to delete the line

file1
10 line
1st line should replace in the last line, last line should come in 1st line

```bash
$ echo day
$ echo day | sed s/day/night/
$ vim myfile.txt >> cat dog mot cat set go cat


## Adding Content TO the file.txt
$ cat > file1.txt << 'EOF'
cat is a pet animal
dog is a loyal animal
I am Badhon
Badhon is a developer
Linux is an operating system
I love Linux
cat and dog are friends
Badhon uses Linux
I am learning DevOps
DevOps is interesting
hello world
hello Badhon
12345
apple banana orange
apple mango orange
EOF

# Replacing the cat to dog to another file
$ sed -e 's/cat/dog/' file1.txt > file2.txt

# Upper Case and Lower case any kind of pattern
$ sed -e 's/cat/dog/' file1.txt > file2.txt
$ sed -e 's/cat/dog/ig' file1.txt > file2.txt


# Remove line from the file.txt
$ sed '1,2d' myfile.txt

# Duplicate the Line
$ sed 'p' file1.txt

# Only the first line of the file
$ sed '1q' file1.txt

```

---

## AWK - Alfred Aho , Peter weinberger && Brain Kerighan

- _awk_ == Extract the Coloumns

```bash
$ ls -l
$ df -h
$ sudo fdisk -l
$ awk '{print $2}' file1.txt
$ awk '{print $2, $4}' file1.txt
$ awk '{print $2,"\t",$4}' file1.txt
$ awk -F, '{print $4}' file1.txt
```
