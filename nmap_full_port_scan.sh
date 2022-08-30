#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage: $0 <ip or domain to scan>"
	exit
fi

ip=$1
nmap -sV -sC -Pn -n -p $(nmap -p- $ip -Pn -n | grep ^[0-9] | awk -F '/' '{print $1}' | sed ':a;N;$!ba;s/\n/,/g') $ip
