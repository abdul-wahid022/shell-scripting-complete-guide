#!/bin/bash

# file_organizer.sh
# Description: Safely organizes files in the current directory by their extension.
# Creates a demo directory if no files are found, so it's always safe to run!
# Usage: ./file_organizer.sh

echo "Starting file organizer..."

# Create 3 demo files if the directory is empty (safe for practice!)
if [ -z "$(ls -A 2>/dev/null)" ]; then
    echo "Creating demo files to organize..."
    echo "This is a text file." > demo.txt
    echo "<?php echo 'Hello'; ?>" > demo.php
    echo "# Python script" > demo.py
fi

# Loop through all items in the current directory
for item in *; do
    # Skip directories and the organizer script itself
    if [ -f "$item" ] && [ "$item" != "file_organizer.sh" ]; then
        # Extract the file extension (e.g., txt, jpg, or "none")
        extension="${item##*.}"
        # If the extension is the same as the filename, it has no extension
        if [ "$extension" == "$item" ]; then
            extension="no_extension"
        fi

        # Create a directory for the extension if it doesn't exist
        mkdir -p "$extension"
        # Move the file into the new directory
        mv "$item" "$extension/"
        echo "📂 Moved '$item' to -> '$extension/'"
    fi
done

echo "✅ File organization complete!"
