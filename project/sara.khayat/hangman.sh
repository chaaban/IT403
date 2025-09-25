#!/bin/bash

# Function to display the masked word
display_word() {
    local word=$1
    local guessed_letters=$2
    local masked=""

    for (( i=0; i<${#word}; i++ )); do
        local letter=${word:i:1}
        if [[ $guessed_letters == *"$letter"* ]]; then
            masked+="$letter "
        else
            masked+="_ "
        fi
    done

    echo "$masked"
}

# Function to check if the game is won
is_game_won() {
    local word=$1
    local guessed_letters=$2

    for (( i=0; i<${#word}; i++ )); do
        local letter=${word:i:1}
        if [[ $guessed_letters != *"$letter"* ]]; then
            return 1
        fi
    done

    return 0
}

# Function to draw the hangman
print_hangman() {
    case $1 in
        0)
            echo "  ____"
            echo "  |  |"
            echo "  |"
            echo "  |"
            echo "  |"
            echo "  |"
            echo "  |"
            ;;
        1)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  |"
            echo "  |"
            echo "  |"
            echo "  |"
            ;;
        2)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  |  |"
            echo "  |"
            echo "  |"
            echo "  |"
            ;;
        3)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  | /|"
            echo "  |"
            echo "  |"
            echo "  |"
            ;;
        4)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  | /|\\"
            echo "  |"
            echo "  |"
            echo "  |"
            ;;
        5)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  | /|\\"
            echo "  | /"
            echo "  |"
            echo "  |"
            ;;
        6)
            echo "  ____"
            echo "  |  |"
            echo "  |  O"
            echo "  | /|\\"
            echo "  | / \\"
            echo "  |"
            echo "__|________"
            ;;
    esac
}

# Play the Hangman game
playHangman() {
    local word="chameleon"  # Change the word here
    local max_guesses=6
    local wrong_guesses=0
    local guessed_letters=""

    echo "Welcome to Hangman!"

    while [[ $wrong_guesses -lt $max_guesses ]]; do
        echo
        print_hangman $wrong_guesses
        echo

        masked_word=$(display_word $word $guessed_letters)
        echo "Word: $masked_word"

        read -p "Enter a letter: " guess

        if [[ ${#guess} -ne 1 ]]; then
            echo "Please enter a single letter."
            continue
        fi

        if [[ $guessed_letters == *"$guess"* ]]; then
            echo "You already guessed that letter."
            continue
        fi

        guessed_letters+=$guess

        if is_game_won $word $guessed_letters; then
            echo "Congratulations! You won the game."
            return
        elif [[ $word == *"$guess"* ]]; then
            echo "Correct guess!"
        else
            echo "Wrong guess!"
            ((wrong_guesses++))
        fi
    done

    echo "Game over! You lost. The word was '$word'."
}

playHangman
