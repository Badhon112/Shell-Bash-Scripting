# Day 2 & 3

## Commands

Shell is an interface between the user and kernel

Bash shell is the default shell in linux OS

echo $SHELL
/bin/bash

cat /etc/redhat-release
cat /etc/lsb/release
cat /etc/shells
cat /etc/passwd

/home -- default directory where user account are created

/

The Shell is going to execute already the pre compiled program .sh

```bash
#!/bin/bash

echo "Enter the First Value"
read var
echo $var
```

#! == Shebank -- Magic character

#! --> will the OS/Kernel to execute the under the bash shell

#!/user/bin/python
#!/user/bin/ruby
#!/user/bin/perl

Execute the Script

There are 3 methods

1. sh firstscript.sh or bash firstscript.sh
2. ./firstscript.sh -- execute permission --> chmod +x firstscript.sh
3. source firstscript.sh or .firstscript.sh

---

## File System

