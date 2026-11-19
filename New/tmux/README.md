## Tmux

```bash

# If tmux is not installed
$ sudo yum install tmux

# To enter the tmux
$ tmux

# To detach from the tmux session
$ ctrl + b
$ d

# Again go to the same tmux session
$ tmux attach # The last tmux session

# To see the list of tmux session
$ tmux ls

# To rename a tmux session
$ tmux rename-session -t 0 top_command

# To rename a tmux session inside the session
$ tmux attach -t number
$ ctrl + b
$ $ # dollar sign

# To attach an existing session
$ tmux attach -t number/name

# From inside the tmux press :(Clone) it will execute the tmux command
$ Ctrl + b
$ :

# To create a new session with the name
$ tmux new -s  split_windows

# To kill the session
$ tmux kill-session -t <name|number>

# To kill all the session
$ tmux kill-server

# We want to end the session when the job execute is done
$  tmux new -t long_running_job
$ cat > File.sh << EOF
!#/bin/bash
sleep 15
EOF

$ chmod 755 File.sh
$ ./File.sh; exit;

# To run a session with detach mode
$ tmux new -d -s long_running_job './File.sh'

```

## Tmux part 2

```bash
# To create a new Windows From the existing session
$ tmux new -t windows_1
$ ctrl + b 
$ c

# To rename a session
$ ctrl + b
$ ,

# To create 
# To split a session In tmux
$ tmux new -s split
$ ctrl + b 
$ # " (Double Clone)

# To go to the split session press up and down arrow
# To exit out of the session
$ ctrl + b # And press "
$ x

# To split the session in vertically
$ ctrl+b 
$ %

# To split the session in vertically Properly
$ ctrl + b
$ %
$ alt + 1

# To see the split number
$ ctrl + b
$ q

```
 
## tmux pt3 : .tmux.conf pt1

```bash
# For mouse Work inside tmux
$ tmux
$ ctrl + b 
$ :
$ set -g mouse on
$ set -g mode-mouse on

# To check the version of tmux
$ tmux -V

# To enable the mouse inside the tmux session
$ vim .tmux.conf
# Enable mouse On
set -g mouse on

# Or

cat > .tmux.conf << EOF
# Enable Mouse On
set -g mouse on
EOF

```