#!/bin/bash

# sysinfo.sh
# Description: Displays basic, safe-to-share system information.
# Usage: ./sysinfo.sh

echo "===== System Snapshot ====="
echo "👋 Hello, $(whoami)"
echo "🕐 Date & Time: $(date)"
echo "💻 Hostname: $(hostname)"
echo "🌐 Public IP: $(curl -s icanhazip.com)"

echo -e "\n----- Storage -----"
# Show disk usage for root, but in a human-readable way
df -h / | awk 'NR==2 {print "📦 Root Disk: " $5 " used (" $3 " / " $2 ")"}'

echo -e "\n----- Memory -----"
free -h | awk 'NR==2 {print "🧠 RAM: " $3 " used / " $2 " total"}'

echo -e "\n----- Uptime -----"
uptime -p
