#!/bin/bash

words="hello world linux code python java script algorithm cryptography mathematics"
word=${words[$RANDOM % ${#words[@]}]}  
max_incorrect=7
incorrect=0
guessed=()

echo "Guess the $((${#word})). letter word!"

while [[ $incorrect -lt $max_incorrect && ${#guessed[@]} -lt ${#word} ]]; do
    echo -n "Guess a letter: "
    read guess

    if [[ " ${guessed[*]} " =~ " $guess " ]]; then
        echo "$guess was already guessed!"
    elif [[ " $word " =~ " $guess " ]]; then
        guessed+=($guess)
        echo "$guess is in the word!"
    else
        incorrect=$((incorrect+1))
        echo "$guess is NOT in the word. $(($max_incorrect-incorrect)) incorrect guesses left."

        # Draw hangman
        case $incorrect in
            1) echo "   |   " ;;
            2) echo "   |   " 
                 echo "   O   " ;;
            3) echo "   |   "  
                 echo "   O   " 
                 echo "   |   " ;;
            4) echo "   |   "  
                 echo "   O   " 
                 echo "  \|   " ;; 
            5) echo "   |   "  
                 echo "   O   " 
                 echo "  \|/  " ;;
            6) echo "   |   " 
                 echo "   O   " 
                 echo "  \|/   " 
                 echo "   |   " ;;
            7) echo "   |   "  
                 echo "   O   " 
                 echo "  \|/   " 
                 echo "   |   "
                 echo "  / \  " ;;
        esac
    fi

    word_progress=""
    for letter in $word; do
        if [[ " ${guessed[*]} " =~ " $letter " ]]; then
            word_progress+="$letter"
        else
            word_progress+="_" 
        fi
    done
    echo -n "Word so far: $word_progress "
    echo 
done

# Rest of script...
