#!/bin/bash

#    (a) Hostname
echo hostname
hostname
echo " "

#    (b) disk/partition size, usage, and mount points
echo disk/partition size, usage, and mount points
df -h
echo " "
#    (c) network devices (name)
echo network devices
nmcli device status
echo " "
#    (d) IP address, broadcast, and netmask for each active device
echo IP address Broadcast  NETMASK
ip a
echo " "
#    (e) OS version/release level, kernel version used
echo release : kernel version : OS version
uname -o -r -v
echo " "
#    (f) security mode (SELinux status)
echo security mode
sestatus
echo " "
#    (g) firewall configuration
echo firewall config
sudo iptables -vnL >/dev/null
echo " "
#    (h) list of active repositories
echo list of active repositories
yum repolist enabled
echo " "
#    (i) number of software packages (rpm, deb, etc) installed
echo number of packages:
yum list installed | wc -l
echo " "
#RPM: $ rpm -qa --last
#RedHat / CentOS: $ dnf list installed
#OpenSuSE: $ zypper se --installed-only
#Arch: $ pacman -Q
#Debian / Ubuntu via DPKG: $ dpkg -l
#Debian / Ubuntu via APT: $ apt list --installed

#    (j) name of software packages installed
echo name of software packages installed
yum list installed
echo " "
#    (k) dns server configured (which dns server(s) will be used for the local resolver)
echo dns server
cat /etc/resolv.conf
echo " "
#    (l) list of active shell users
echo active shell users
who
echo " "
#    (m) date the os was first installed 
echo OS Date first installed
rpm -qi basesystem 2> /dev/null | sed -r -n '/^Install Date[[:space:]]*:/{s@[[:space:]]{2,}.*$@@g;s@^[^:]+:[[:space:]]*(.*)$@\1@g;p}'
echo " "
#    (n) hardware details: cpu, main memory size, swap memory configure, devices, etc.
echo Hardware:
echo CPU
lscpu
echo " "
echo main memory size   swap memory configure   devices  
free && swapon -s
echo " "
#    (o) services current running
sudo systemctl | grep running
echo " "
#    (p) services installed but not running
sudo systemctl | grep disabled
echo " "
#    (q) any other information/data you think that is important and necessary to have.
