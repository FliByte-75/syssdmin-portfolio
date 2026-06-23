#!/bin/bash

# Simulate a server's hard drive usage percentage

echo "Checking system storage..."
STORAGE_USED=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
TIME_STAMP=$(date "+%Y-%m-%d %H-%M-%S")
LOG_FILE="./server_storage.log"
echo "=== Running Live Storage Audit ==="
# Test if storage is greater than 80%
if [ "$STORAGE_USED" -gt 80 ]; then
    echo "🚨 WARNING: [$TIME_STAMP] Storage is at ${STORAGE_USED}%. Server is running out of space!" | tee -a $LOG_FILE
else
    echo "✅ SUCCESS [$TIM__STAMP] Storage is at ${STORAGE_USED}%. All systems normal." | tee -a $LOG_FILE
fi

echo "============================================================"
