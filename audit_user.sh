#!/bin/bash
# ========================================================
# STEP 1: THE TRANSLATOR
# ========================================================
# This script runs natively in the Bash shell

# ========================================================
# STEP 2: THE VAULT (Variables)
# ========================================================
# $1 captures the username you type on the command line
USERNAME=$1
PASSWORD_FILE="/etc/passwd"

# ========================================================
# STEP 3 & 4: THE ENGINE & THE ACTION
# ========================================================
echo "=== SECURITY PORTAL: USER AUDIT CONTROLLER ==="

# The Engine: grep searches for the username inside the passwd file.
# We use '> /dev/null' to stay "Golden" and hide the raw file text noise!
if grep -q "^$USERNAME:" $PASSWORD_FILE; then
    # The Action if TRUE (User exists)
    echo "STATUS: SUCCESS - Account '$USERNAME' is present on this system."
else
    # The Action if FALSE (User doesn't exist)
    echo "ALERT: WARNING - Account '$USERNAME' does NOT exist!"
fi
