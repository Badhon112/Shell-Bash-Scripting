# Day 3

Shell Buffer - 1024 bytes -> 4096 bytes is the memory size, where history output are stored

1. Aliases : Short name given for long command
2. Job Control : Cron job and at command
3. Quoting (` `)
4. Brace Expansion
5. Tilde Expansion
6. Variable substitution
7. Arithmetic substitution
8. Command separators

---

### Aliases

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

To find all the user level command type

```bash

$ cd /usr/bin
$ ls

```

---

### Output Quoting (` `)

```bash
$ echo -e "Red \nHat \n Linux"
$ echo -e "Today the date is `date`"
$ echo -e "Hello \t \t Everyone"

```

---

### Brace Expansion

```bash
$ mkdir amit{1,2,3,4,5}
$ echo sp{ea, eb, ec}l
```

### Tilde Expansion (~) ==> current home working directory

```bash
$ ~
```

### Variable Substitution :

There are no variable type as such in Bash, But the max u can define a variable in bash as integer

```bash
$ declare -i a
$ echo "I took $5 From You"
$ echo "I took \$5 from You"



```

---

## Arithmetic substitution

There are 5 Methods for Arithmetic substitutions

```bash
$ a=10
$ b=20

$ c=$(($a+$b))

$ echo $c
```

---

## Command Separators

; && ||

```bash
$ ls; date; who
$ ls && date
$ ltt && date
$ ls && data
$ ls || date
```

---

# Day 3.1

## Login Shell, NonLogin Shell

**Login Shell**

WHenever a valid user with username and password, login into the system, he will get the default shell (Bash) and is called as login Shell.

During login into the system, there are some configuration files which are been executed to get the login Shell

1. System level Configuration Files:
   - /etc/profile
   - /etc/bashrc
   - /etc/DIR_COLORS

2. User-Level Configuration Files:
   - .bash_profile
   - .bashrc
   - .bash_logout

**NonLogin Shell**

There is no username/password, but you can get into nonlogin shell from being in login shell for nonlogin shell /etc/bashrc will get executed

