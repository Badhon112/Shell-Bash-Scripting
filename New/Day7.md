## Bash Environment: Customizing the environment, shell history, and prompt configuration

## (72) ENV vars, alias, Functions

```bash

# Check all the environment variable
$ env

$ env | less
$ env | grep USER

# Create a environment variable
$

```

**alias**

```bash
# Alias setup
# file delete

$ touch DeleteMe.txt
$ alias rm="rm -i"
$ rm DeleteMe.txt

# To check all the alias format
$ alias

# To remove an alias
$ unalias rm

#====================
# Function
#====================

# By typing multiple command we need function

$ function myfunc1() {
$ ls ~
$ echo "This is the Home Directory of user $USER"
$ }

$ function myfun2() {
$ myfunc1
$ echo "The First parameter you entered is : $1"
$ echo "The Second parameter you entered is : $2"
$ }

# To unset the Function
$ unset myfun1
$ usset env_name

```

## (73) Login shell non login shell

- **There are 2 shell**
  - _Interactive login shell_
    - $ whoami
  - _Interactive non-login shell_
    - When you try to login

## (75) history pt1

```bash

# To see the history
$ history

# To clear out history
$ history -c

# IT will create a .bash_history
$ history -w
```

## (77) Custom Prompt

```bash
# The command prompt is store in the env variable ps1
$ echo $PS1

# Changed the PS1 Value it will changed the terminal prompt
$ PS1="=> "

# Change the terminal Prompt
$ PS1="\@"


# https://ezprompt.net/

```
