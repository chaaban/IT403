#!/bin/bash

state=true
declare -a board=("1" "2" "3" "4" "5" "6" "7" "8" "9")
current_player="X"

# Function to display the game board
function display_board() {
    clear
    echo "-------------"
    echo "| ${board[0]} | ${board[1]} | ${board[2]} |"
    echo "-------------"
    echo "| ${board[3]} | ${board[4]} | ${board[5]} |"
    echo "-------------"
    echo "| ${board[6]} | ${board[7]} | ${board[8]} |"
    echo "-------------"
}

# Function to check for a winning condition
function check_win() {
    local player=$1
    if [[ ${board[0]} == $player && ${board[1]} == $player && ${board[2]} == $player ]] ||
       [[ ${board[3]} == $player && ${board[4]} == $player && ${board[5]} == $player ]] ||
       [[ ${board[6]} == $player && ${board[7]} == $player && ${board[8]} == $player ]] ||
       [[ ${board[0]} == $player && ${board[3]} == $player && ${board[6]} == $player ]] ||
       [[ ${board[1]} == $player && ${board[4]} == $player && ${board[7]} == $player ]] ||
       [[ ${board[2]} == $player && ${board[5]} == $player && ${board[8]} == $player ]] ||
       [[ ${board[0]} == $player && ${board[4]} == $player && ${board[8]} == $player ]] ||
       [[ ${board[2]} == $player && ${board[4]} == $player && ${board[6]} == $player ]]
    then
        echo "Player $player wins!"
        state=false
    fi
}

# Function to check for a tie condition
function check_tie() {
    local count=0
    for ((i = 0; i < ${#board[@]}; i++))
    do
        if [[ ${board[$i]} == "X" || ${board[$i]} == "O" ]]
        then
            ((count++))
        fi
    done
    if ((count == 9))
    then
        echo "It's a tie!"
        state=false
    fi
}

# Function to switch players
function switch_players() {
    if [[ $current_player == "X" ]]
    then
        current_player="O"
    else
        current_player="X"
    fi
}

# Function to validate and make a move
function make_move() {
    local position=$1
    if [[ $position -ge 1 && $position -le 9 && ${board[$position - 1]} != "X" && ${board[$position - 1]} != "O" ]]
    then
        board[$position - 1]=$current_player
        display_board
        check_win $current_player
        check_tie
        switch_players
    else
        echo "Invalid move! Please try again."
    fi
}

# Main game loop
while $state
do
    display_board
    read -p "Player $current_player, enter your move (1-9): " move
    make_move $move
done
