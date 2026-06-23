#!/bin/bash
# =========================================================
# ENTERPRISE SECURITY CONSOLE: CENTRAL OPREATIONS NETWORK
# =========================================================

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

clear
echo "==================================================="
echo "SECURITY MATRIX: CENTRAL OPERATIONS PANEL"
echo "Active Session: $USER"
echo "Initialization: $TIMESTAMP"
echo "==================================================="
echo "1) Run Infrastructure Ping Sweep Scan"
echo "2) Interrogate Target Service Endpoints"
echo "3) Deploy Automated Unattended Health Surveyor"
echo "4) Engage Perimeter Firewall Defense Matrix"
echo "5) Run Infrastructure Capacity & Disk Guardian"
echo "6) Exit Operations Center"
echo "==================================================="
read -p "Select tactical objective [1-6]: " REQ_OP

case $REQ_OP in
     1)
       echo "=============================================="
       echo "SYSTEM INITIATION: INTERNAL PING SWEEP ENGINE"
       echo "=============================================="
       read -p "Enter target subnet prefix (e.g., 172.17.6): " USER_SUBNET

       # Deploy Subnet Validation Gate (Checks for X.X.X format)
       if [[ $USER_SUBNET =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
           echo "Subnet syntax verified. Connecting sweep..."
            ./ping_sweep.sh $USER_SUBNET
       else
           echo "CRITICAL ERROR: Invalid Subnet syntax detected."
           echo "Operational flight scrubbed to protect system stability."
       fi
       ;;
     2)
       echo "=============================================="
       echo "SYSTEM INITIATION: SERVICE ENDPOINT INTERROGATOR"
       echo "=============================================="
       read -p "Enter target host IP (e.g., 172.17.6.53): " USER_TARGET

       # Deploy the Validation Gate
       if [[ $USER_TARGET =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
           echo "Input syntax verified. Interrogating host..."
           ./audit_network_services.sh $USER_TARGET
       else
          echo "CRITICAL ERROR: Invalid IPv4 target format detected."
          echo "Operational flight scrubbed to protect system stability."
       fi
       ;;
     3)
       echo "============================================="
       echo "DEPLOYING REMOTE HEALTH SURVEYOR DRONE"
       echo "============================================="
       echo "Launching connection handshake with 5-second maximum boundary..."

       # Run script with a strict 5-second stopwatch wrapper
       timeout 5s ./remote_health_check.sh
       STATUS_CODE=$?

       # Deploy a multi-stage triage gate
       if [ $STATUS_CODE -eq 0 ]; then
           echo "SUCCESS: Remote metrics extracted and compiled safely."
       elif [ $STATUS_CODE -eq 124 ]; then
           echo "CRITICAL TIMEOUT: Remote server hung and failed to respond within 5s."
           echo "Action Required: Verify host power state and network rounting."
       else
           echo "CONNECTION FAILED: Remote health surveyor dropped with error code: $STATUS_CODE"
           echo "Status: Target network endpoint unraechable or access denied."
       fi
       echo "============================================="
       ;;
     4)./managed_firewall.sh
       ;;
     5)
        echo "==============================================="
        echo "INITIATING SYSTEM GAURDIAN: STORAGE METRICS"
        echo "==============================================="
        # Call your existing tool to append to logs behind the scenes
        ./system_guardian.sh

        # Pull a live look straight to the screen using my logic!
        LIVE_USE=$(df -h / | awk 'NR==2 {print $5}')
        echo "Current Root Storage Utilization: $LIVE_USE"
        echo "Status: Safe parameters verified. Log entry generated."
        echo "==============================================="
        ;;
     6)
       echo "Shutting down operations panel safely. Goodbye."
       exit O
       ;;
     *)
       echo "ERROR: Invalid selection. Operational parameters breached."
       ;;
esac
