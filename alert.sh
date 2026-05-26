#!/bin/bash
# Grab the percentage of disk used
USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//')
if [ $USAGE -gt 80 ]; then
  echo" ALERT: Russell, your disk is at $USAGE%. Time to clean!"
else
  echo " ALL CLEAR: Disk is only at $USAGE%. Keep flying. Pilot."
fi
