#!/bin/bash

# File Organizer

# Define the directory to be organized
echo "enter file path to sort"
read target_dir

# Create directories for different file types if they don't already exist
mkdir -p "${target_dir}/Images"
mkdir -p "${target_dir}/Documents"
mkdir -p "${target_dir}/Videos"
mkdir -p "${target_dir}/Others"

# Move files to their corresponding directories based on their types
for file in "${target_dir}"/*; do
    if [ -f "$file" ]; then
        case "${file##*.}" in
            jpg|jpeg|png|gif|bmp)
                mv "$file" "${target_dir}/Images"
                ;;
            doc|docx|pdf|txt|rtf)
                mv "$file" "${target_dir}/Documents"
                ;;
            mp4|mkv|avi|mov)
                mv "$file" "${target_dir}/Videos"
                ;;
            *)
                mv "$file" "${target_dir}/Others"
                ;;
        esac
    fi
done

echo "File organization complete!"
