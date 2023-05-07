#!/bin/bash

# initialize score counters
player_score=0
computer_score=0

# function to generate computer's move
function computer_move {
  options=("rock" "paper" "scissors")
  computer_choice=${options[RANDOM % 3]}
}

# function to determine winner of a round
function determine_winner {
  if [[ "$1" == "rock" && "$2" == "scissors" ]] || \
     [[ "$1" == "paper" && "$2" == "rock" ]] || \
     [[ "$1" == "scissors" && "$2" == "paper" ]]
  then
    echo "Player wins!"
    player_score=$((player_score + 1))
  elif [[ "$2" == "rock" && "$1" == "scissors" ]] || \
       [[ "$2" == "paper" && "$1" == "rock" ]] || \
       [[ "$2" == "scissors" && "$1" == "paper" ]]
  then
    echo "Computer wins!"
    computer_score=$((computer_score + 1))
  else
    echo "It's a tie!"
  fi
}

# main game loop
while true; do
  # display current scores
  echo "--------------------------------------------------------------"
  echo -e "\n"
  echo "Current score: Player $player_score - $computer_score Computer"

  # prompt player for their move (or end game)
  read -p "Enter your move (1=rock, 2=paper, 3=scissors, 0=end game): " player_choice

  # end game if player enters 0
  if [[ "$player_choice" == "0" ]]; then
    echo "Final score: Player $player_score - $computer_score Computer"
    if (( player_score > computer_score )); then
      echo "Player wins the game!"
    elif (( computer_score > player_score )); then
      echo "Computer wins the game!"
    else
      echo "It's a tie game!"
    fi
    break
  fi

  # determine player's move based on input
  case "$player_choice" in
    1) player_move="rock";;
    2) player_move="paper";;
    3) player_move="scissors";;
    *) echo "Invalid input, please try again."; continue;;
  esac

  # generate computer's move
  computer_move

  # display moves and determine winner
  echo "Player chose $player_move"
  echo "Computer chose $computer_choice"
  determine_winner "$player_move" "$computer_choice"
done

