# Process Management: Monitoring processes (⁠ps⁠, ⁠top⁠) and managing background sessions (⁠screen⁠, ⁠tmux⁠)

## (59) ps

Name: ps - report a snapshot of the current processes.

```bash
# Check How many process are there
$ ps

# To check all the running process by the current user
$ ps -a

# TO check all the running process by the all user
$ ps -ax

# To see what user is running what job we can add the lowercase u
$ ps -aux

# For long format
$ ps -axl | less

# f for full format
$ ps -axf | less

# For Everything
$ ps -e

# For All
$ ps -A

# For f and F
$ ps -ef
$ ps -eF

# For Hierarchy
$ ps -efH | less

#
$ ps aux --sort -pcpu | LESS

```

## (60,61) Top pt1

```bash
# A zombie process is a process that didn't end properly

$ top

# To check all the cpu result press 1

# For memory line Show type m
# For memory % Use shift + e

# We can changed the time update between update
$ d

# We can change the screen fresh rate by type in
$ SpaceBar

# Lowercase u will changed the user filter by
$ u / user_id

# if we want to see 10 line of code
$ n

# all line of code
$ n+0

# lowercase b in reverse order
$ b

# Lowercase x will highlight the cpu %
$ x
$ y

# sort by memory uses
$ M

# sort by time uses
$ t

# High % of cpu uses
$ p

# Our screen show in color
$ z

```

## (63) Kill process

```bash
# run some process 
dd if=/dev/zero of=/dev/null

# Run the top command
$ top

# To kill a process in top command press lowercase k
$ k

# Enter to kill the process
# Enter esc to exit out the input

# To kill the job from the command line
$ kill 2391

# To kill the process forcefully
$ kill -9|-k 2391

# To check all the different way to kill a process
$ kill -l

# We can kill the process by there name
$ pkill <job_name>
$ pkill firefox
$ pkill -f firefox

# To kill process by the username
$ sudo killall -u <user_name>

# To shutdown the server
$ sudo shutdown -h now
```

## (64) Foreground Background

```bash
# To run a job run in the background enter & in the last of the command

$ dd if=/dev/zero of=/dev/null

# to start the last background process 
$ bg 

# To quit the background process
$ fg

# To start a job that need to run on the background
$ dd if=/dev/zero of /dev/null &

# To see the list of job that is running on the background
$ jobs

# + is the current job
# - is the next in line job

# With the job of the pid
$ jobs -l

```