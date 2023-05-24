#!/bin/bash

# Array to store authenticated usernames
authenticated_users=()

# Function to create a user
create_user() {
    local username=$1
    local password=$2

    if sudo id -u $username >/dev/null 2>&1; then
        echo "User $username already exists"
    elif sudo useradd -m $username >/dev/null 2>&1; then
        if echo "$username:$password" | sudo chpasswd --crypt-method SHA512 >/dev/null 2>&1 ; then
            echo "User '$username' created successfully."
        else
            sudo userdel -r $username >/dev/null 2>&1
            echo "Failed to set the password for user '$username'. Hint: Choose a strong password"
        fi
    else
        echo "Failed to create user '$username'."
    fi
}

# Function to authenticate a user
authenticate() {
    local username=$1
    local password=$2
    
    chmod +x ./chkpasswd.sh

    if id $username >/dev/null 2>&1; then
        if echo "$password" | sudo ./chkpasswd.sh $username - >/dev/null 2>&1; then
            authenticated_users+=("$username")
            echo "User '$username' authenticated."
        else
            echo "Wrong password."
        fi
    else
        echo "User '$username' does not exist."
    fi
}

# Function to start tic-tac-toe game
start_tic_tac_toe() {
    echo "Starting Tic-Tac-Toe game..."
    chmod +x ./game.sh
    source ./game.sh
    # Add your game logic here
}

# Main function
main() {
    while true; do
        # Prompt for menu choice
        echo "Menu:"
        echo "1. Create User"
        echo "2. Authenticate User"
        echo "3. Start Tic-Tac-Toe"
        read -p "Enter your choice (1-3): " choice
        echo

        case $choice in
            1)
                if [ ${#authenticated_users[@]} -lt 2 ]; then
                    read -p "Enter a username: " username
                    read -s -p "Enter password: " password
                    echo
                    create_user "$username" "$password"
                else
                    echo "Players are ready to play."
                fi
                ;;
            2)
                if [ ${#authenticated_users[@]} -lt 2 ]; then
                    read -p "Enter a username: " username
                    read -s -p "Enter password: " password
                    echo
                    authenticate "$username" "$password"
                else
                    echo "Maximum number of authenticated users reached."
                fi
                ;;
            3)
                start_tic_tac_toe
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac
        # Print authenticated usernames
        echo "Authenticated users: ${authenticated_users[@]}"

        read -p "Press Enter to continue..."
        clear
    done
}

# Call the main function
main
