#!/bin/bash
PORTFOLIO_DIR="/home/student/sysadmin-portfolio"
DEFAULT_LATENCY="45"
echo "=== BEGIN AUTOMATED DAILY MAINTENANCE ==="
if [ -d "$PORTFOLIO_DIR" ]; then
    echo "Portfolio directory found. Initializing network diagnostics..."
 $PORTFOLIO_DIR/triage_network.sh "$DEFAULT_LATENCY"
else
    echo "ERROR: Portfolio directory missing!"
    exit 1
fi

echo "=== MAINTENANCE TASK COMPLETE ==="
