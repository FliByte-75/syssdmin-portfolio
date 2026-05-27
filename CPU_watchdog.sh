#!/bin/bash
echo "=== ENTERPRISE PROCESSOR THERMAL WATCHDOG ==="
read -p "Enter current CPU core temperature (in C): " TEMP
echo "Initiating thermal boundary analysis..."
if [ "$TEMP" -ge 80 ]; then
echo " CRITICAL EXHAUSTION: Core is melting (${TEMP} C)! Activating emergency backup coolant lines!"
elif [ "$TEMP" -ge 60 ]; then
echo " WARNING: Core thermal boundaries crossing limits (${TEMP} C). Spooling hardware server fans to 100% power."
else
echo " OPTIMAL: Core operating temperature is stable (${TEMP} C). Hardware status normal."
fi
