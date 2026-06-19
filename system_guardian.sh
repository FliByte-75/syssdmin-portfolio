#!/bin/bash
# This complex pipeline extracts the exact percentage of your hard drive usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
MAX_THRESHOLD="85"
ALERT_LOG="$HOME/sysadmin-portfolio/sys_guardian.log"
if [ "$DISK_USAGE" -gt "$MAX_THRESHOLD" ]; then
    echo "CRITICAL WARNING: Disk usage is at ${DISK_USAGE}%!" >> $ALERT_LOG
fi
