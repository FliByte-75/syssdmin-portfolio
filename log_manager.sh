#!/bin/bash

SOURCE="/home/student/sysadmin-portfolio"
BACKUP_DIR="/home/student/archive"

if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

cp $SOURCE/*.log $BACKUP_DIR/ 2>/dev/null
echo "Log maintenance complete at $(date)"
