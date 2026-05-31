#!/bin/bash
echo "=== ENTERPRISE PROCESSOR THERMAL WATCHDOG ==="
# Squeezes RANDOM  dice-roll number range (0 and 32,767), to a 0-64 range, then add 30 to simulate a 30 C to 94 C CPU sensor
TEMP=$(( 30 + RANDOM % 65 ))
SERVER_NAME=$1
echo "Initiating thermal boundary analysis..."
if [ "$TEMP" -ge 80 ]; then
echo " CRITICAL EXHAUSTION: Core is melting on ${SEVER_NAME} (${TEMP} C)! Activating emergency backup coolant lines on $SERVER_NAME" >> "${SERVER_NAME}_cpu.log"
elif [ "$TEMP" -ge 60 ]; then
echo " WARNING: Core thermal boundaries crossing limits on ${SERVER_NAME} (${TEMP} C). Spooling hardware server fans to 100% power on $SERVER_NAME" >> "${SERVER_NAME}_cpu.log"
else
echo " OPTIMAL: Core operating temperature is stable on ${SERVER_NAME} (${TEMP} C). Hardware status normal on $SERVER_NAME" >> "${SERVER_NAME}_cpu.log"
fi
