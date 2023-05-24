#!/bin/bash

# Initialize the board
board=(1 2 3 4 5 6 7 8 9)

# Print the board
print_board() {
    echo ""
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "---+---+---"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "---+---+---"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
    echo ""
}

# Check if the game is over
is_game_over() {
    # Check rows
    for i in {0..6..3}; do
        if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} ]]; then
            return 0
        fi
    done

    # Check columns
    for i in {0..2}; do
        if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} ]]; then
            return 0
        fi
    done

    # Check diagonals
    if [[ ${board[0]} == ${board[4]} && ${board[4]} == ${board[8]} ]]; then
        return 0
    fi

    if [[ ${board[2]} == ${board[4]} && ${board[4]} == ${board[6]} ]]; then
        return 0
    fi

    # Check for tie game
    for i in "${board[@]}"; do
        if [[ $i != "X" && $i != "O" ]]; then
            return 1
        fi
    done

    return 0
}

# Main game loop
while true; do
    print_board

    # Player X's turn
    read -p "Player X's turn. Enter a number from 1-9: " position
    while [[ ${board[$position-1]} == "X" || ${board[$position-1]} == "O" ]]; do
        read -p "That position is already taken. Enter a different number: " position
    done
    board[$position-1]="X"

    # Check if X won or if it's a tie game
    if is_game_over; then
        print_board
        echo "Game over!"
        break
    fi

    print_board

    # Player O's turn
    read -p "Player O's turn. Enter a number from 1-9: " position
    while [[ ${board[$position-1]} == "X" || ${board[$position-1]} == "O" ]]; do
        read -p "That position is already taken. Enter a different number: " position
    done
    board[$position-1]="O"

    # Check if O won or if it's a tie game
    if is_game_over; then
        print_board
        echo "Game over!"
        break
    fi
done
