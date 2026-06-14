#!/bin/bash
#============================================================
# SYSTEM RECONNAISSANCE: NETWORK SERVICE AUDITOR
#============================================================

TARGET=$1
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Safety Check: Enforce target input boundaries
if [ -z "$TARGET" ]; then
    echo "ERROR: A target IP address or hostname is required."
    echo "Usage: ./audit_network_services.sh [TARGET]"
    echo "Example: ./audit_network_services.sh 127.0.0.1"
    exit 1
fi

echo "=========================================================="
echo " INITIATING INFRASTRUCTURE SECURITY ALERT"
echo "Target: $TARGET"
echo "Time: $TIMESTAMP"
echo "========================================================="

echo "Scanning system for active TCP network services..."
echo "--------------------------------------------------"

# Run nmap securely, filtering specifically for lines containing "open"
# We store the raw resuts inside an internal variable pool!
SCAN_RESULTS=$(nmap $TARGET | grep "open")

if [ -z "$SCAN_RESULTS" ]; then
     echo " SECURITY ALERT: No open management services detected."
else
     echo "OPEN CHANNELS IDENTIFIED:"
     echo "$SCAN_RESULTS"
     echo "-------------------------------------------------"
     # Advanced Forensics Validation: Check if web operations are running
     if echo "$SCAN_RESULTS" | grep -q "http"; then
          echo "ANALYSIS: Activate HTTP Web Endpoint detected on this host."
        fi
     # Advanced Forensics Validation: Check if remote terminals are open
     if echo "$SCAN_RESULTS" | grep -q "ssh"; then
         echo " ANALYSIS: Remote Management Access (ssh) is enabled."
     fi
fi

echo "================================================="
echo "Audit phase is complete."
