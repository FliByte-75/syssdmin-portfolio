#!/bin/bash

echo "=== ENTERPRISE NETWORK TRIAGE TOOL ==="
LATENCY=$1
# Swapping the interactive prompt for a high-performance command-line argument ($1) LATENCY=$1

# Quick safety check: If they forgot to type a number, remind them how to run it!
if [ -z "$LATENCY" ]; then
     echo "ERROR: Missing argument. Usage: ./triage_network.sh [latency_in_ms]"
     exit 1
fi

echo "Analyzing network stability for $LATENCY ms..."

# Choice 1: Is latency greater than or equal to 150ms?
if [ "$LATENCY" -ge 150 ]; then
    echo "🚨 CRITICAL: Latency is severely high (${LATENCY}ms)! Traffic dropping imminent."

# Choice 2: If not, is it greater than or equal to 50ms?
elif [ "$LATENCY" -ge 50 ]; then
    echo "⚠️ WARNING: Network is experiencing jitter (${LATENCY}ms). Performance degraded."

# Choice 3: If it's lower than 50ms, fall back here.
else
    echo "✅ OPTIMAL: Latency is excellent (${LATENCY}ms). Network routing is healthy."
fi
