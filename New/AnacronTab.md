## Anacron

```bash
# Lets look at the anacron file
$ ls -lh /etc/cron*

# Checkout the daily anacron tab
$ less /etc/cron

# Switch to root user
$ sudo su -

# create a script in the daily folder
$ cd /etc
$ ls -lh | grep cron
$ cd grep.daily
$ vim anacronDailytest
    -> ![Anacron Daily Test](./Anacron/Daily.sh)

$ chmod 755 anacronDailytest


# create a script file in the weekly folder
$ cd /etc
$ ls -lh | grep cron
$ cd grep.weekly
$ vim anacronWeeklyTest
    -> ![Anacron Weekly Test](./Anacron/weekly.sh)

$ chmod 755 anacronWeeklyTest

```

**Cron tab**

Anacron configuration

```bash
$ cat /etc/crontab
$ vim /etc/crontab
# This replace cron's entries
1       5       cron.daily      run-parts --report /etc/cron.daily
7       10      cron.weekly     run-parts --report /etc/cron.weekly


# To check the the last time the cron job update daily weekly and monthly anacron run
$ cd /var/spool/anacron/


```
