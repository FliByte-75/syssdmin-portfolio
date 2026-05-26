#!/bin/bash

echo "=== ENTERPRISE GATEWAY CONTROL ==="
# 'read -p' prompts the user for input and saves it into a variable named USER_AGE
read -p "Enter your clearance level (1-100): " CLEARANCE

echo "Evaluating privileges..."

# Check if the clearance level entered is Greater Than or Equal To 75
if [ "$CLEARANCE" -ge 75 ]; then
    echo "🔓 ACCESS GRANTED: Senior SysAdmin privileges activated."
else
    echo "🔒 ACCESS DENIED: Insufficient clearance level."
fi
