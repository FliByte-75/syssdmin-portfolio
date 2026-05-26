#!/bin/bash
echo "---DISK SPACE ---"
df -h | grep "/$"
echo ""
echo "---MY IDENTITY ---"
whoami
echo ""
echo "--- RECENT FROGS ---"
ls -l | tail -n 5
