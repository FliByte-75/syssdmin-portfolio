#!/bin/bash

# Define clear system variables
PORT=8080
LOG_FILE="$HOME/wormhole_server.log"

echo "=========================================="
echo "🚀 INITIALIZING WORMHOLE ENTERPRISE SERVER"
echo "=========================================="

# Step 1: Check if Port 8080 is already being used
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  CRITICAL ERROR: Port $PORT is already in use by another process!"
    echo "Exiting setup to prevent system collision."
    exit 1
fi

# Step 2: Start the Python server and redirect output to a log file
echo "🌐 Launching local HTTP server on port $PORT..."
python3 -m http.server $PORT >> "$LOG_FILE" 2>&1 &

# Give Python exactly 2 seconds to bind to the port safely
sleep 2

# Step 3: Launch the secure SSH tunnel
echo "🔐 Piercing firewall and establishing secure SSH tunnel..."
echo "------------------------------------------"
ssh -R 80:localhost:$PORT localhost.run
