#!/bin/bash

# File Management Program

# Define the directory where the operations will be performed
directory="/path/to/directory"

# Function to display the menu options
display_menu() {
    echo "File Management Program"
    echo "-----------------------"
    echo "1. List files"
    echo "2. Create a file"
    echo "3. Delete a file"
    echo "4. Rename a file"
    echo "5. Search for a file"
    echo "6. Exit"
    echo
}

# Function to list files in the directory
list_files() {
    echo "Listing files in $directory:"
    ls -l $directory
    echo
}

# Function to create a new file
create_file() {
    echo -n "Enter the name of the new file: "
    read filename
    touch $directory/$filename
    echo "File created successfully: $directory/$filename"
    echo
}

# Function to delete a file
delete_file() {
    echo -n "Enter the name of the file to delete: "
    read filename
    rm -i $directory/$filename
    echo "File deleted successfully: $directory/$filename"
    echo
}

# Function to rename a file
rename_file() {
    echo -n "Enter the current name of the file: "
    read current_name
    echo -n "Enter the new name for the file: "
    read new_name
    mv $directory/$current_name $directory/$new_name
    echo "File renamed successfully from $current_name to $new_name"
    echo
}

# Function to search for a file
search_file() {
    echo -n "Enter the name of the file to search for: "
    read filename
    results=$(find $directory -name "$filename" 2>/dev/null)
    if [ -z "$results" ]; then
        echo "File not found: $filename"
    else
        echo "Search results for $filename:"
        echo "$results"
    fi
    echo
}

# Main program loop
while true; do
    display_menu
    echo -n "Enter your choice (1-6): "
    read choice
    echo

    case $choice in
        1) list_files ;;
        2) create_file ;;
        3) delete_file ;;
        4) rename_file ;;
        5) search_file ;;
        6) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
