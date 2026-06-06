#!/bin/bash

# Simulate a server's hard drive usage percentage
STORAGE_USED=$()

echo "Checking system storage..."
STORAGE_USED=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Checking live system storage..."
# Test if storage is greater than 80%
if [ "$STORAGE_USED" -gt 80 ]; then
    echo "🚨 WARNING: Storage is at ${STORAGE_USED}%. Server is running out of space!"
else
    echo "✅ SUCCESS: Storage is at ${STORAGE_USED}%. All systems normal."
fi
