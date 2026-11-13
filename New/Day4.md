# System Tools & Text Processing: Managing time/date, using text tools (⁠wc⁠, ⁠sort⁠, ⁠grep⁠, ⁠sed⁠, ⁠awk⁠, ⁠xargs⁠), and regular expressions

## (30) Time and Date pt1

**_Date_**

```bash
# to see date and time
$ date

# To see the utc time and date
$ date -u

# To see the date and time yesterday and tomorrow
$ date -d yesterday
$ date -d tomorrow

# To see the date 2 weeks ago
$ date -d "2 weeks ago"
$ date -d "-2 weeks"

# To see the future 2 weeks date
$ date -d "+2 weeks"
$ date -d "2 weeks"

# We can specific day
$ date -d "2 weeks 3 days"
$ date -d "2 weeks 2 hours"

# To sho the date in year-month-day format
$ date +%F

# Full spelling the day of the weeks
$ date +"%A %F"
$ date +"Today is %A %F"

# To get the weekend_day_name year/month/day
$ date +"Today is %A %Y/%m/%d"
$ date +"Today's date is \"%A\" %Y/%m/%d \\"

# To get the right time
$ date +%T

# To see the specific time Zone
$ TZ="Dhaka/Asia" date
$ TZ="Dhaka/Asia" date +%T
```

- **Switches**
  - _%A_ = Is the weekend name.
  - _%F_ = "2026-11-13"
  - _%Y_ = Year
  - _%m_ = month
  - _%d_ = day
  - _%T_ = Time
  - _%H_ = hours
  - _%M_ = Minute
  - _%S_ = second

## (32) timedatectl / timezones

```bash
# To see the time and date in the server or computer
$ timedatectl

# To set the local time zone
$ sudo date -s 2026-11-13

# To the real time clock
$ sudo timedatectl set-time 2026-11-13

# To turn on the ntp
$ sudo timedatectl set-npt true

# To set the timezone available using timedatectl
$ timedatectl list-timezone
$ timedatectl list-timezone | Grep Dhaka

# To set the timezone
$ timedatectl set-timezone Asia/Dhaka
$ timedatectl

# To check the Time zone file
$ ls -l /etc/localtime

# To check the datetimectl status
$ sudo systemctl status systemd-timesyncd
```

## (32) stat

stat is a command line utility that displays detailed information about given file or file system.

_Syntax_

```bash
$ stat [option] [file]
```

stat accepts one or more input FILE names and includes a number of option that control the command behavior and output.

```bash
# Display File Information
$ stat file.txt
```

**file information**

- File : the name of the file
- Size : The size of the file in bytes
- Blocks : The number of allocated blocks the file takes
- IO Block : The size in bytes of every block
- File Types: For example: regular file, directory, or symbolic link
- Device: Device number in hex and decimal
- Inode : The Inode number
- Links: Number of hard link
- Access: File permission of numeric and symbolic form
- Uid: User ID and the name of the owner
- Gid: Group id and name of the owning group
- Context: SE-Linux
- Access: The last time the file was accessed.
  - cat file1.txt
- Modify: The last time the file's content modify.
  - echo "This file is modify" >> file1.txt
- Change: The last time the file's attribute or permission changed.
  - chmod 777 file1.txt
- Birth : File creation time

_Display fileSystem Information_

```bash
$ stat -f file1.txt
```

- _Customizing the Output_
  - %n : File name
  - %s : total size of that file
  - %b : Number of block allocated
  - %A : Permission in human readable form
  - %a : permission in octal
  - %U : User name of owner
  - %G : Group name of owner
  - %i : Inode number
  - %F : File type
  - %y : Time of last modification (human-readable)
  - %x : Time of last access (human-readable)
  - %z : Time of last status change (human-readable)
  - %w : Time of file birth (human-readable)

```bash
# Too check the file permission and group  and the accessed on an the file name
$ stat --printf="\n=File :%n\nWas last accessed on: %x\nHasa group of %G\nAns Permission of :%A\n\n" file1.txt
```

## (33) wc, sort, uniq

_wc_ : wc stand for word count
_sort_ : sort stand for sorting the character for the wordList.txt
_uniq_ :  

```bash
$ wc file1.txt
# Output:           38      121     486         file1.txt
# Output Format :   Line    Word    Character   File_Name

# To see the Line of the file
$ cat -n file1.txt

# Just the Line of that file content
$ wc -l file1.txt

# To see the word list in sorted format
$ sort file1.txt

# To see the word list in reversed order
$ sort -r file1.txt

# To save the output of the file file1.txt
$ sort file1.txt > sorted_file1.txt

# To see only the unique value
$ sort -u file1.txt

# For more filter of the unique value
# -f : means fold each letter
$ sort -uf file1.txt

$ sort file1.txt | uniq

# To find out which on is duplicated
$ sort file1.txt | uniq -d
$ sort file1.txt | uniq -d -i
$ sort file1.txt | uniq -Di

```
