#!/bin/bash

# Check if running with root privileges
if [ $(id -u) != 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check the number of arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <compression_method>"
    exit 1
fi

# Define backup parameters
backup_dest="/backups"
backup_name="server-backup-$(date +%Y-%m-%d-%H-%M-%S)"
backup_files=(
    "/etc"
    "/var/www"
    "/home"
)

# Create backup directory
backup_dir="$backup_dest/$backup_name"
mkdir -p "$backup_dir"

# Create log file
log_file="$backup_dir/backup.log"
touch "$log_file"

# Copy files to backup directory
echo "Copying files to backup directory..."
for file in "${backup_files[@]}"; do
    cp -a "$file" "$backup_dir" >> "$log_file" 2>&1
done

# Compress backup directory using the specified compression method
compression_method="$1"
backup_archive="$backup_dest/$backup_name.$compression_method"
case "$compression_method" in
    "zip")
        echo "Compressing backup directory using zip..."
        zip -r "$backup_archive" "$backup_dir" >> "$log_file" 2>&1
        ;;
    "gzip")
        echo "Compressing backup directory using gzip..."
        tar czf "$backup_archive.gz" -C "$backup_dest" "$backup_name" >> "$log_file" 2>&1
        ;;
    "lzma")
        echo "Compressing backup directory using lzma..."
        tar cJf "$backup_archive.xz" -C "$backup_dest" "$backup_name" >> "$log_file" 2>&1
        ;;
    *)
        echo "Unsupported compression method: $compression_method"
        exit 1
        ;;
esac

# Verify backup archive
echo "Verifying backup archive..."
if tar tf "$backup_archive" > /dev/null; then
    echo "Backup archive is valid."
else
    echo "Backup archive is corrupted!"

fi >> "$log_file" 2>&1

echo "Backup process completed. Please see $log_file for details."
