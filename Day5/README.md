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
