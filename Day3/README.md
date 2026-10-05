Shell Buffer - 1024 bytes -> 4096 bytes is the memory size, where history output are stored

```bash

$ vim index.sh
#!/bin/bash

echo "Enter the First Value"
read var
echo $var

$ alias myscript="cd /home/kali && ./index.sh"
$ alias billbouce="cd /home/weblogic/apps && ./stop.sh && sleep 60 && ./stop.sh"

# alias is a short name for execute a large command. It is unseated.

$ unalias myscript
# Remove the alias from the system

# For a permanent alias system we need to do 
$ la
$ vim .bashrc
    alias c="clear"

reload
```
