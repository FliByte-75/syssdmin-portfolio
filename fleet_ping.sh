#!/bin/bash
echo "=== ENTERPRISE NETWORK RANGE SCANNER ==="

# The loop picks up EVERY argument ($@) you type on the command line
for SERVER in "$@"
do
    echo "--------------------------------------------"
    echo "Checking connection to device: $SERVER..."
    
    # Run a quick 1-second ping test to check the connection
    if ping -c 1 -W 1 "$SERVER" > /dev/null 2>&1; then
        echo "STATUS: $SERVER is ONLINE and responding."
    else
        echo "ALERT: $SERVER is OFFLINE or blocking traffic!"
    fi
done

echo "--------------------------------------------"
echo "Scan complete!"
