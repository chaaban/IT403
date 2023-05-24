#!/bin/bash

# Check if a file name is provided as an argument
if [ $# -eq 0 ]; then
  echo "Please provide a file name as an argument."
  exit 1
fi

file_name=$1

# Check if the file exists
if [ ! -f "$file_name" ]; then
  echo "File $file_name does not exist."
  exit 1
fi

# Read the file and count word occurrences
declare -A word_count

while IFS= read -r line; do
  # Remove punctuation and convert to lowercase
  line=$(echo "$line" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]')

  # Split the line into words
  words=($line)

  # Count word occurrences
  for word in "${words[@]}"; do
    if [ -n "$word" ]; then
      ((word_count[$word]++))
    fi
  done
done < "$file_name"

# Calculate the total number of words in the file
total_words=0

for count in "${word_count[@]}"; do
  ((total_words += count))
done

# Display the top N most frequently occurring words
N=10

echo "Top $N most frequently occurring words in $file_name:"

# Sort the word count in descending order
sorted_words=()
while IFS=$'\t' read -r -d $'\n' key value; do
  sorted_words+=("$key $value")
done < <(for key in "${!word_count[@]}"; do echo -e "$key\t${word_count[$key]}"; done | sort -k2 -rn)

# Display the word count and percentage
for ((i = 0; i < N && i < ${#sorted_words[@]}; i++)); do
  word_info=(${sorted_words[$i]})
  word="${word_info[0]}"
  count="${word_info[1]}"
  percentage=$(bc -l <<< "scale=2; $count / $total_words * 100")

  echo "$word: $count times ($percentage%)"
done

