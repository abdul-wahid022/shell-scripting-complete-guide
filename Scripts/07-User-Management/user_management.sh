#!/bin/bash

# user_management.sh
# Description: A safe, simulated user management menu. No system changes are made.
# Usage: ./user_management.sh

# Simulated user database file
SIMULATED_DB="./simulated_users.txt"

# Initialize the simulated database with sample users if it doesn't exist
if [ ! -f "$SIMULATED_DB" ]; then
    echo "Initializing simulated user database..."
    echo "alice:Alice Smith:1001" > "$SIMULATED_DB"
    echo "bob:Bob Jones:1002" >> "$SIMULATED_DB"
fi

while true; do
    echo -e "\n👥 Simulated User Management"
    echo "1. List users"
    echo "2. Add a user (simulated)"
    echo "3. Delete a user (simulated)"
    echo "4. Exit"
    read -p "Choose an option (1-4): " choice

    case $choice in
        1)
            echo -e "\n📋 User List:"
            echo "Username:Name:UID"
            echo "-----------------"
            cat "$SIMULATED_DB"
            ;;
        2)
            read -p "Enter new username: " new_user
            read -p "Enter full name: " full_name
            # Simulate generating a UID
            new_uid=$(( 1000 + $(wc -l < "$SIMULATED_DB") + 1 ))
            echo "$new_user:$full_name:$new_uid" >> "$SIMULATED_DB"
            echo "✅ Simulated adding user: $new_user ($full_name)"
            ;;
        3)
            read -p "Enter username to delete: " del_user
            # Use grep to simulate user deletion
            if grep -q "^$del_user:" "$SIMULATED_DB"; then
                grep -v "^$del_user:" "$SIMULATED_DB" > "${SIMULATED_DB}.tmp"
                mv "${SIMULATED_DB}.tmp" "$SIMULATED_DB"
                echo "✅ Simulated deletion of user: $del_user"
            else
                echo "❌ User not found: $del_user"
            fi
            ;;
        4)
            echo "Goodbye! 👋"
            exit 0
            ;;
        *)
            echo "❌ Invalid option. Please choose 1-4."
            ;;
    esac
done
