#!/bin/bash
# =========================================================
# ENTERPRISE AUTOMATION: REMOTE HEALTH SURVEYOR
# =========================================================

TARGET="127.0.0.1"
USER="tudent"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "===================================================="
echo "INITIATING AUTOMATED REMOTE HEALTH CHECK"
echo "Connecting to: $USER@$TARGET"
echo "Time:          $TIMESTAMP"
echo "===================================================="

echo "Connecting securely via Ed25519 Cryptographic Key..."
echo "---------------------------------------------------"

# Here is the magic: We tell SSH to connect, run the disk space command 'df -h /', and disconnect instantly!
REMOTE_DISK_SPACE=$(ssh -o BatchMode=yes $USER@$TARGET "df -h /")

if [ $? -eq 0 ]; then
    echo "CONNECTION SUCCESSFUL!"
    echo "REMOTE STORAGE STATUS:"
    echo "$REMOTE_DISK_SPACE"
else
    echo "CONNECTION FAILED: Check network path or key validation."
fi

echo "================================================="
echo "Remote automated health check complete."
