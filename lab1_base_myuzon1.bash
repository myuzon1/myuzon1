#!/bin/bash

#    (a) Hostname
echo hostname
hostname


#    (b) disk/partition size, usage, and mount points
echo disk/partition size, usage, and mount points
df -h

#    (c) network devices (name)
echo network devices
nmcli device status

#    (d) IP address, broadcast, and netmask for each active device
echo IP address Broadcast  NETMASK
ip a

#    (e) OS version/release level, kernel version used
echo release : kernel version : OS version
uname -o -r -v

#    (f) security mode (SELinux status)
echo security mode
sestatus

#    (g) firewall configuration
echo firewall config
sudo iptables -vnL >/dev/null

#    (h) list of active repositories
echo list of active repositories
yum repolist enabled

#    (i) number of software packages (rpm, deb, etc) installed
echo number of packages:
yum list installed | wc -l
#RPM: $ rpm -qa --last
#RedHat / CentOS: $ dnf list installed
#OpenSuSE: $ zypper se --installed-only
#Arch: $ pacman -Q
#Debian / Ubuntu via DPKG: $ dpkg -l
#Debian / Ubuntu via APT: $ apt list --installed

#    (j) name of software packages installed
echo name of software packages installed
yum list installed
#    (k) dns server configured (which dns server(s) will be used for the local resolver)
echo dns server
cat /etc/resolv.conf
#    (l) list of active shell users
echo active shell users
who
#    (m) date the os was first installed 
echo OS Date first installed
rpm -qi basesystem 2> /dev/null | sed -r -n '/^Install Date[[:space:]]*:/{s@[[:space:]]{2,}.*$@@g;s@^[^:]+:[[:space:]]*(.*)$@\1@g;p}'
#    (n) hardware details: cpu, main memory size, swap memory configure, devices, etc.
echo Hardware:
echo CPU
lscpu
echo main memory size   swap memory configure   devices  
free && swapon -s
#    (o) services current running
sudo systemctl | grep running
#    (p) services installed but not running
sudo systemctl | grep disabled
#    (q) any other information/data you think that is important and necessary to have.
