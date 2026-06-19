#!/bin/bash
# ========================================================
# SYSTEM DEFENSE MODULE: PERIMETER FIREWALL CONTROLLER
#=========================================================

# Define a simulated hostile IP address we want to block from our network
HOSTILE_IP="192.168.1.99"

echo "================================================="
echo "INITIATING FIREWALL POLICY DEFENSE SEQUENCE"
echo "================================================="

# 1. First. let's make sure the default incoming policy is safe
echo "Setting default perimeter rule: Allow all outgoing, block unrecognized incoming..."
sudo ufw default deny incoming > /dev/null
sudo ufw default allow outgoing > /dev/null

# 2. Block the specific  hostile IP address from knocking on any port
echo "DEPLOYING BAN RULE: Blocking all traffic from $HOSTILE_IP..."
sudo ufw deny from $HOSTILE_IP to any

# 3. Explicitly keep Port 22 open so your cryptographic SSH keys can still get in!
echo "DEPLOYING ACCESS RULE: Ensuring Port 22 (SSH) remains accessible..."
sudo ufw allow 22/tcp

echo "--------------------------------------------------"
echo "Enabling firewall engine..."
sudo ufw --force enable

echo "=================================================="
echo "CURRENT LIVE FIREWALL PERIMETER RULES:"
echo "=================================================="
sudo ufw status numbered
