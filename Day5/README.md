# Networking

Networking Monitoring Tools:

---

### Ifconfig

To execute these below command . it is better to switch to root user

- ifconfig, ifup eth0,ifdown eth0,ping,traceroute 8.8.8.8,netstat.
- dig www.google.com, nslookup, route, host, arp, ethtool, hostname
- nmap, ip, ss, tracepath, ipref, tcpdump, telnet

_Example :ifconfig_

```bash

# Will give you the ip address of that system (mtu = maximum transfer Unit)
$ ifconfig

# to check the network connectivity in the network
$ ping <loop_back>

# To check just one network
$ ifconfig <Network Name> # Ex: eth0, lo

# To create a virtual ip address
$ ifconfig eth0:1 <IP> # ifconfig eth0:1 192.168.10.10

# Network Configuration Files
$ /etc/sysconfig/network-scripts
$ cat ifcfg-lo

```

---

### ifup and ifdown

_Example: ifdown and ifup_

```bash
# to down a particular network interface
$ ifdown lo

# to up the network interface
$ ifup lo


```

### Ping

```bash
# To ping a  count number of that ip
$ ping -c3 <ip>

# Linux
# -i 3 = wait 3 second between ping packets
# send 3 ping . then stop
$ ping -i 3 -c 4 <ip>

# Windows
# -w 3000 = wait 3 second for the next ping
# -n 4 = send 4 ping . then stop
$ ping -w 3000 -n 4 <ip>


# Just give the summery of that ping

$ ping -i 3 -c 4 -q <ip>
$ ping -c 3 -i 4 -q 192.168.71.129


# After that specific second the ping will stop
$ ping -w 10 <ip>

# Ping Thickness
$ ping -s 500 <ip>

#
$ ping -D <ip>


```

---

## traceroute 8.8.8.8

```bash
# Install traceroute
$ yum install traceroute

# check how many hub are there
$ traceroute 8.8.8.8
```

## Netstat

To check the available port number are running.

```bash
# To check the available port number are running
$ netstat -tulnp

# The Routing Table
$ netstat -r

#
$ netstat -i

```

**Dig and Dns Query**

```bash
$ dig google.com
```

**NsLookUp and Route Commands ARP**

```bash
$ route
$ route -n
$ host www.google.com


# Address Resolution Protocol
$ arp -e

# Check the network activity
$ ethtool eth0

# Check the hostname
$ hostname

# hostname -i
$ hostname -I



```

---

wget = Download file
curl = Download // CheckSum

---

# Scripting

if condition, it else, if else

Syntax

```bash

if [test-condition]
then
    -----
    -----
else
    -----
    -----
fi

# -------------------

if [test-condition]; then
-----
-----
else
-----
-----
fi

# -------------------

if [[-e "Badhon" ]]
then
    echo "The File Exists"
else
    echo "The file does not exits"
fi

# --------------------

# [] ===> "Badhon"

if test -e "Badhon"
then
    echo "The File Exists"
else
    echo "The file does not exits"
fi
```

---

Index.sh

```bash
cat > file1.sh << 'EOF'

#!/bin/bash

# Author Name: Badhon Biswas
# Date : 14/10/2026

echo "Enter 1st Value"
read a

echo "Enter 2nd Value"
read b

echo "Enter the equal value"
read c

if test $(($a + $b)) -eq $c
then
    echo "The Sum of the value is Equal "
else
    echo "They are not equal"
fi
EOF

```

---

**_Leaf Year Check_**

```bash
cat > leap_year.sh << 'EOF'
#!/bin/bash

echo "LEAP YEAR SHELL SCRIPTING"
echo "ENTER the year"
read year_check

if [ `expr $year_check % 4` -eq 0 ]
then
	echo "$year_check is a leap year"
else
	echo "$year_check is not a leap year"
fi
EOF

```

---

**_Multi Condition_**

```bash

# $1 is equal to position parameter
# We can pass max 18 parameter
# sh multi_condition.sh {1...18}

cat > multi_condition.sh << 'EOF'
#!/bin/bash

# echo "Enter A Number"
a=$1

if [ $a -lt 20 ]; then
	echo "This number is less than 20"
elif [ $number -ge 20 ] && [ $number -lt 40 ]; then
	echo "The number is between 20 and 40"
elif [ $number -ge 40 ] && [ $number -lt 60 ]; then
	echo "The number is between 40 and 60"
else
	echo "The number is greater then or equal 60"
fi
EOF

```

```bash
$ sh multi_condition.sh 30
```

---

**_Install Git_**

```bash
#!/bin/bash

# Getting the user ID

userID=$ (id -u)
# userID=`id -u`

# Checking the user is root or not

if [ $userID -eq 0 ]
then 
	echo "The user has root access"
else 
	echo "You are not root users, plz run this script being root user"
	exit 1
fi 

echo "====================================="
echo "		  Install Git Package		   "
echo "====================================="
echo "\n\n"

yum install git -y

# Checking the exit status

if [ $? -eq 0 ]
then
	echo "The Git package has successfully installed"
else 
	echo "The git package has not installed"
fi 
```