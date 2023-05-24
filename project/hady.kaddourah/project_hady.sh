#!/bin/bash

# Set the path to the finance data file
DATA_FILE="finance_data.txt"

# Check if the finance data file exists, and create it if it doesn't
if [ ! -e "$DATA_FILE" ]; then
  touch "$DATA_FILE"
fi

# Function to add a new transaction
add_transaction() {
  echo "Enter transaction details:"
  
  read -p "Date (YYYY-MM-DD): " date
  read -p "Description: " description
  read -p "Amount: " amount
  
  # Append the transaction to the data file
  echo "$date|$description|$amount" >> "$DATA_FILE"
  
  echo "Transaction added successfully!"
}

# Function to view all transactions
view_transactions() {
  if [ ! -s "$DATA_FILE" ]; then
    echo "No transactions found."
  else
    echo "Transaction history:"
    echo "-------------------"
    
    # Read and display each transaction from the data file
    while IFS='|' read -r date description amount; do
      echo "Date: $date"
      echo "Description: $description"
      echo "Amount: $amount"
      echo "-------------------"
    done < "$DATA_FILE"
  fi
}

# Function to calculate total expenses
calculate_expenses() {
  total_expenses=0
  
  # Read each transaction from the data file and calculate the total expenses
  while IFS='|' read -r _ _ amount; do
    total_expenses=$((total_expenses + amount))
  done < "$DATA_FILE"
  
  echo "Total Expenses: $total_expenses"
}

# Main menu
while true; do
  echo "Personal Finance Management"
  echo "--------------------------"
  echo "1. Add a Transaction"
  echo "2. View Transactions"
  echo "3. Calculate Expenses"
  echo "4. Quit"
  
  read -p "Enter your choice (1-4): " choice
  
  case $choice in
    1)
      add_transaction
      ;;
    2)
      view_transactions
      ;;
    3)
      calculate_expenses
      ;;
    4)
      echo "Thank you for using the Personal Finance Management script. Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
  
  echo
done

