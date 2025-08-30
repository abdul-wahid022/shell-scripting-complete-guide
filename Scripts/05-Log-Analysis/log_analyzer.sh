#!/bin/bash

# log_analyzer.sh
# Description: Analyzes a log file for errors. Creates a sample log for demo.
# Usage: ./log_analyzer.sh [logfile.log]

LOG_FILE="${1:-./script.log}"

# Create a sample log file for demonstration if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    echo "Creating a sample log file for analysis: $LOG_FILE"
    cat > "$LOG_FILE" << EOF
[INFO] Application started successfully.
[DEBUG] Connecting to database at 127.0.0.1:3306.
[WARN] Disk usage above 80%.
[ERROR] Failed to connect to database!
[INFO] User 'admin' logged in.
[CRITICAL] Database connection lost! Attempting reconnect.
[ERROR] File not found: /var/www/config.ini
[INFO] Backup process started.
EOF
fi

echo "🔍 Analyzing log file: $LOG_FILE"
echo "========================================"

# Count all log levels
echo "Log Level Summary:"
echo "------------------"
grep -o "```math
[A-Z]*```" "$LOG_FILE" | sort | uniq -c | sort -nr

# Show the most recent ERROR or CRITICAL message
echo -e "\n⛔ Most Recent Critical Error:"
echo "-------------------------------"
grep "```math
ERROR```\|```math
CRITICAL```" "$LOG_FILE" | tail -n 1 || echo "No critical errors found. Good job!"
