#!/bin/bash

# system_backup.sh
# Description: Creates a compressed backup of the user's Documents folder.
# Backs up to /tmp/ for safety. Adds a timestamp to the filename.
# Usage: ./system_backup.sh

# Define source and destination
SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="/tmp/backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_NAME="documents-backup-$TIMESTAMP.tar.gz"

echo "📦 Starting backup of: $SOURCE_DIR"

# Check if source exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Error: Source directory $SOURCE_DIR does not exist." 1>&2
    exit 1
fi

# Create backup destination if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "⏳ Creating backup: $BACKUP_NAME..."
# Create the compressed archive
if tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$HOME" Documents 2>/dev/null; then
    # Get the file size in a human-readable format
    FILE_SIZE=$(du -h "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)
    echo "✅ Backup successful!"
    echo "   File: $BACKUP_NAME"
    echo "   Size: $FILE_SIZE"
    echo "   Location: $BACKUP_DIR/"
else
    echo "❌ Backup failed!" 1>&2
    exit 1
fi
