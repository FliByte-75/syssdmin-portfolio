#!/bin/bash
# =========================================================
# COMPLIANCE ENGINE: HISTORICAL LOG ROTATION & ARCHIVER
# =========================================================

# Define path using our absolute tilde shourtcut
LOG_DIR="$HOME/sysadmin-portfolio"
ACTIVE_LOG="$LOG_DIR/sys_guardian.log"
BACKUP_DIR="$LOG_DIR/backups"

# Create a highly precise, unique ISO timestamp string
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="sys_guardian_$TIMESTAMP.tar.gz"

echo "======================================================"
echo "INITIATING COMPLIANCE LOG ROTATION SEQUENCE"
echo "======================================================"

# 1. Verification Gate: Does the active log file even exists?
if [ ! -f "$ACTIVE_LOG" ]; then
    echo "NOTICE: Active log file not found. Nothing to rotate."
    exit 0
fi

# 2. Infrastructure Gate : Ensure the backup archive directory exists
mkdir -p "$BACKUP_DIR"

echo "Archiving active logs from: $ACTIVE_LOG"
echo "Target Destination:         $BACKUP_DIR/$ARCHIVE_NAME"
echo "--------------------------------------------------"

# 3. Compress the active log file into a timestamped tarball archive
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" sys_guardian.log

if [ $? -eq 0 ]; then
    echo "SUCCESS: Archive compiled and compressed successfully."

    # 4. Critical Step: Clear the contents of the archive log so it starts fresh at 0 bytes
     truncate -s 0 "$ACTIVE_LOG"
    echo "STATUS: Active tracking log truncate and reset."
else
    echo "CRITICAL FAILURE: Tarball compression engine dropped an error."
    exit 1
fi
echo "==================================================="
