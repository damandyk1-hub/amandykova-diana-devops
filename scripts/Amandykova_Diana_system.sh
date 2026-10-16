#!/bin/bash
# Amandykova Diana - system info script

INFO="$(dirname "$0")/../Amandykova_Diana_info.txt"
LINE="=============================="

echo "$LINE"
echo "Student Information"
echo "$LINE"
echo
echo "Name: Diana"
echo "Surname: Amandykova"
echo "Group: IT-2314"
echo "Student ID: 41547"
echo
echo "$LINE"
echo "System Information"
echo "$LINE"
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date '+%d.%m.%Y %H:%M:%S')"
echo "Operating System: $(uname -s) $(uname -r)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/Mem:/ {print $3 " used of " $2}')"
echo

if [ -f "$INFO" ]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi
