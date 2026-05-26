#!/bin/bash
# Turn on the history feature inside the script
set -o history
HISTFILE=-/.bash_history
history -r

echo "--- RUSSELL'S TOP 10 RECENT WINS ---"
history | tail -n 10
