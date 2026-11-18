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
```bash

```
