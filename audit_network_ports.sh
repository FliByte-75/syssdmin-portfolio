#!/bin/bash
# ========================================================
# STEP 1: THE TRANSLATOR
# ========================================================
# Natively running in the Bash shell

# ========================================================
# STEP 2: THE VAULT (Networking Parameters)
# ========================================================
# 8.8.8.8 is a global Google DNS server. Port 53 handles DNS routing.
TARGET_IP=$1
PORT=$2

echo "=== INFRASTRUCTURE TRIAGE: NETWORK SOCKET AUDITOR ==="
# Safety Check: If EITHER argument is missing (-z), tell the user how to run it!
if [ -z "$TARGET_IP" ] || [ -z "$PORT" ]; then
    echo "❌ ERROR: Missing arguments!"
    echo "Usage: ./audit_network_ports.sh [IP_OR_URL] [PORT]"
    echo "Example: ./audit_network_ports.sh google.com 443"
    echo "====================================================="
    exit 1
fi
echo "Probing connection pathway to $TARGET_IP on Port $PORT..."

# ========================================================
# STEP 3 & 4: THE ENGINE & THE ACTION
# ========================================================
# -z = Zero-I/O mode (scanning flag; don't send data, just look for an open port)
# -w 2 = Wait timeout limit (if server drops packets, give up after 2 seconds)
# > /dev/null 2>&1 = Dumps terminal noise to keep our screen clean!

if nc -z -w 2 $TARGET_IP $PORT > /dev/null 2>&1; then
    # The Action if TRUE (Connection successful)
    echo "🌐 NETWORK STATUS: SUCCESS! Connection to $TARGET_IP on port $PORT is OPEN."
else
    # The Action if FALSE (Connection failed)
    echo "❌ NETWORK ALERT: CRITICAL! Port $PORT is blocked, closed, or host is offline."
fi

echo "======================================================="
