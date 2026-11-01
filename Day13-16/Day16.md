## SSH Debug

```bash
$ ssh -v <username>:<ServerIP>
```

To make it more secure to login to different port. Add a affemieral port number add a different free port number.

```bash
# Server 2
$ vim /etc/ssh/sshd_config

# Uncommit the port and add this port number
Port 9999

# Server 1 : From the main server try to established connection on port
$ ssh <UserName>@<Server_IP> -p 9999

```

Linux --> AWS --> Disable selinux also they the Firewall

security_group --> create firewall

```bash

$ yum install firewall-utils -y
$ firewalld -

# selinux --> Will be enabled.

# Uptime of the System
$ uptime


# To execute command in a different Server type
$ ssh -t <UserName>@<Server_IP> 'top'
$ ssh -t -o StrictHostKeyChecking=NO <username>@<ServerIP> 'top'

```

---

## Execute file in different Linux Server

```bash
$ vim Index.sh
#!/bin/bash

echo "Hello Every One"


$ ssh -t <UserName>@<ServerIP> "bash Index.sh"

```

**sshpass**

Command or utility will help you to automate many task, where in it will login to the server and execute the command or the scripts.

```bash
$ yum install sshpass -y
$ yum repolist 

```