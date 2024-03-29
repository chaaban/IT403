#!/bin/bash

# Function to convert letters to digits
convert_letter_to_digit() {
  local letter=$1
  case $letter in
    [A-Ca-c]) echo 2;;
    [D-Fd-f]) echo 3;;
    [G-Ig-i]) echo 4;;
    [J-Lj-l]) echo 5;;
    [M-Om-o]) echo 6;;
    [P-Sp-s]) echo 7;;
    [T-Vt-v]) echo 8;;
    [W-Zw-z]) echo 9;;
    *) echo "$letter";;  # Return the letter as is if it's not a valid digit
  esac
}

# Function to format the converted number
format_phone_number() {
  local number=$1
  local formatted_number=""

  # Add opening parentheses
  formatted_number+="(${number:0:3}) "

  # Add middle part with a dash
  formatted_number+="${number:3:3}-${number:6}"

  echo $formatted_number
}

# Validate the number of arguments
if [[ $# -ne 1 ]]; then
  echo "Invalid number of arguments. Please provide one phone number."
  exit 1
fi

# Extract the input number from the command-line argument
phone_number=$1

# Validate input as a valid phone number
if ! [[ $phone_number =~ ^[0-9A-Za-z]{10}$ ]]; then
  echo "Invalid phone number format. Please provide a 10-character alphanumeric phone number."
  exit 1
fi

# Convert letters to digits in the phone number
converted_number=""
for ((i = 0; i < ${#phone_number}; i++)); do
  digit=$(convert_letter_to_digit "${phone_number:i:1}")
  converted_number+=$digit
done

# Format the converted number
formatted_number=$(format_phone_number "$converted_number")

echo "Original phone number: $phone_number"
echo "Converted phone number: $formatted_number"
