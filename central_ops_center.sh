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
echo "4) Exit Operations Center"
echo "==================================================="
read -p "Select tactical objective [1-4]: " REQ_OP

case $REQ_OP in
     1)
       echo "=============================================="
       echo "SYSTEM INITIATION: INTERNAL PING SWEEP ENGINE"
       echo "=============================================="
       read -p "Enter target subnet prefix (e.g., 172.17.6): " USER_SUBNET
       ./ping_sweep.sh $USER_SUBNET
       ;;
     2)
       echo "=============================================="
       echo "SYSTEM INITIATION: SERVICE ENDPOINT INTERROGATOR"
       echo "=============================================="
       read -p "Enter target host IP (e.g., 172.17.6.53): " USER_TARGET
       ./audit_network_services.sh $USER_TARGET
       ;;
     3)
       echo "--> Deploying Remote Health Surveyor Drone..."
       ./remote_health_check.sh
       ;;
     4)
       echo "Shutting down operations panel safely. Goodbye."
       exit O
       ;;
     *)
       echo "ERROR: Invalid selection. Operational parameters breached."
       ;;
esac
