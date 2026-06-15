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
echo "5) Exit Operations Center"
echo "==================================================="
read -p "Select tactical objective [1-4]: " REQ_OP

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
       echo "--> Deploying Remote Health Surveyor Drone..."
       ./remote_health_check.sh
       ;;
     4)./managed_firewall.sh
       ;;
     5)
       echo "Shutting down operations panel safely. Goodbye."
       exit O
       ;;
     *)
       echo "ERROR: Invalid selection. Operational parameters breached."
       ;;
esac
