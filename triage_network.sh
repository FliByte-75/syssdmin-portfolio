#!/bin/bash

echo "=== ENTERPRISE NETWORK TRIAGE TOOL ==="

# Prompt the user for input and capture it in a variable named LATENCY
read -p "Enter current packet latency (in milliseconds): " LATENCY

echo "Analyzing network stability..."

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
