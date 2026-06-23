#!/bin/bash
# ========================================================
# STEP 1: THE TRANSLATOR
# ========================================================
# Running natively in the Bash shell

# ========================================================
# STEP 2: THE VAULT (The Network Base)
# ========================================================
# Grabs the subnet prefix from the first thing you type after the command
SUBNET=$1
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
#This creates a unique report file name based on the current date!
DATE_STAMP=$(date "+%Y-%m-%d")
REPORT_FILE="./network_report_${DATE_STAMP}.log"
echo "=== INFRASTRUCTURE RECON: UNIVERSAL PING SWEEP ==="

# Safety Check: Did they forget to give us a network target?
if [ -z "$SUBNET" ]; then
    echo "❌ ERROR: Missing subnet target!"
    echo "Usage: ./ping_sweep.sh [FIRST_THREE_OCTETS]"
    echo "Example: ./ping_sweep.sh 172.20.0"
    exit 1
fi

#Initilize the report file header
echo "===NETWORK RECON REPORT: $TIMESTAMP ===" | tee -a $REPORT_FILE
echo "Scanning subnet range: ${SUBNET}.0 to ${SUBNET}.10..." | tee -a $REPORT_FILE
echo "==================================================" | tee -a $REPORT_FILE

# ========================================================
# STEP 3 & 4: THE ENGINE (The Loop) & THE ACTION
# ========================================================
# This loop says: "Create a variable named 'IP', and run this block 
# continuously while changing 'IP' from 1, to 2, to 3... all the way to 10."

for IP in {0..10}; do
    TARGET="${SUBNET}.${IP}"
    
    # -c 1 = Send exactly 1 packet (we want to be fast!)
    # -W 1 = Wait only 1 second for an answer before giving up
    if ping -c 1 -W 1 $TARGET > /dev/null 2>&1; then
        echo "🟢 HOST FOUND [$TIMESTAMP] Device at $TARGET is ONLINE!" | tee -a $REPORT_FILE
    else
        echo "⚪ HOST MISSNG: [$TIMESTAMP] Device at $TARGET is offline/unreachable." | tee -a $REPORT_FILE
    fi
done

echo "==================================================" | tee -a $REPORT_FILE
echo "Scan complete. Results archived to $REPORT_FILE"

