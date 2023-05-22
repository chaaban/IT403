#!/bin/bash

# Function to shuffle the containers
shuffle_containers() {
    shuffled_containers=($(shuf -i 1-$NUM_CONTAINERS))
}

# Function to hide the object in a container
hide_object() {
    hidden_container=${shuffled_containers[0]}
}

# Function to display the containers
display_containers() {
    echo "Guess the position of the hidden object!"
    for container in "${shuffled_containers[@]}"; do
        echo "[$container]  "
    done
}

# Function to prompt user if he wants to play again
continueGame(){
while true;
do
	read -p "Play again? (y/n): " play_again

        case "$play_again" in 
        [Yy])
           GameCode 
        ;;
        [Nn])
            echo "Thank you for playing! Goodbye!"
            exit 0
        ;;
        *)
           echo "Invalid input Enter y for yes or n for no"

        ;;
       esac
   done

}


# Function to prompt for the number of containers
prompt_num_containers() {
    read -p "Enter the number of containers: " NUM_CONTAINERS
}

# Function to prompt for user guess
prompt_guess() {
    read -p "Enter your guess (1-$NUM_CONTAINERS): " guess
}

# Function to validate the user guess
validate_guess() {
    if [[ $guess =~ ^[0-9]+$ ]] && (( guess >= 1 && guess <= NUM_CONTAINERS )); then
        return 0
    else
        return 1
    fi
}

# Function to check the guess and display the result
check_guess() {
    if [[ $guess -eq $hidden_container ]]; then
        echo "Congratulations! You found the hidden object!"
    else
        echo "The object was hidden in container $hidden_container ;)"
    fi
}
#Function that conatians the code of the Game
GameCode(){
    while true; do
        shuffle_containers
        hide_object
        display_containers
        prompt_guess
        if validate_guess; then
            check_guess
        else
            echo "Invalid input. Please enter a valid number."
        fi
      
      continueGame

done
}

# Function to play the game
play_game() {
     prompt_num_containers
     GameCode
}

#play the game
play_game
