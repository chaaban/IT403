#!/bin/bash

# Set the length of the secret code and the number of attempts
code_length=4
max_attempts=10

# Generate a random code of the specified length
generate_code() {
  local code=""
  for (( i=1; i<=$code_length; i++ )); do
    code="$code$(( RANDOM % 6 + 1 ))"
  done
  echo "$code"
}

# Get the player's guess
get_guess() {
  read -p "Enter your guess (4 digits from 1-6): " guess
  while [[ ! "$guess" =~ ^[1-6]{4}$ ]]; do
    read -p "Invalid guess. Enter your guess (4 digits from 1-6): " guess
  done
}

# Check a guess against the secret code and give feedback
check_guess() {
  local guess=$1
  local correct=0
  local misplaced=0
  for (( i=0; i<$code_length; i++ )); do
    if [[ ${guess:i:1} == ${secret_code:i:1} ]]; then
      (( correct++ ))
    elif [[ ${secret_code[*]} =~ ${guess:i:1} ]]; then
      (( misplaced++ ))
    fi
  done
  echo "Correct: $correct   Misplaced: $misplaced"
}

# Main game loop
echo "Welcome to Mastermind!"
secret_code=$(generate_code)
for (( attempt=1; attempt<=$max_attempts; attempt++ )); do
  echo "Attempt $attempt of $max_attempts:"
  get_guess
  check_guess "$guess"
  if [[ "$guess" == "$secret_code" ]]; then
    echo "Congratulations, you guessed the code!"
    exit 0
  fi
done
echo "Sorry, you didn't guess the code. The secret code was $secret_code."
