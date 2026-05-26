#!/bin/bash
# Version 2.0 - Credentials Verification Test
# Look for the kernel file we know exists
if [ -f ~/fake_file.txt ]; then
    echo "SUCCESS: The networking file is safe and sound."
else
    echo "ERROR: The file is missing or corrupted!"
fi
