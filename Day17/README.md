## Scheduling Jobs with at command and Crontab

at command, crontab

at command is very useful for scheduling one time tasks.

ex: Showdown system at the specified time
Taking one time backup

_Syntax_

```bash
echo "bash backup.sh" | at 09.00AM

# OR in command line, run first at 09:00Am then enter and given the command or script to run and finally press CTRL+D

$ date
$ tty
$ at 03:12 AM
> echo "Hello World" > /dev/pts/0
> CTRL+D
>

# Check how many job are there
$ atq

```

---

## Scheduling job with crontab

The crontab is used for running specific tasks on a regular interval
Each user (root or normal user) can schedule the jobs using crontab command

Syntax:

```bash
$ minutes(s)    Hours(s)    days(s)     month(s)        weekday(s) command/script
$ 0-59          0-23         1-31         1-12              0-6 0-Sun,Mon-1
$ *****
```

Don't change the order and six fields are separated by spaces
The first 5 fields integer patterns or \* and the sixth is the command/scripts to execute

```bash
# Install cronie
$ sudo yum install cronie -y

# Start the services
$ sudo systemctl start crond

# to schedule a job
$ crontab -e

# to list the jobs
$ crontab -l 

# to remove all the jobs
$ crontab -r 
```
