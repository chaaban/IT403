#!/bin/bash

# Display the options to the user
echo "Currency Converter"
echo "1. Convert amount"
echo "2. View exchange rates"
echo "3. Exit"

# Prompt the user for the selected option
read -p "Enter your choice: " choice

case $choice in
    1)
        # Prompt the user for the amount, source currency, and target currency
        read -p "Enter the amount to convert: " amount
        read -p "Enter the source currency code (e.g., USD): " source_currency
        read -p "Enter the target currency code (e.g., EUR): " target_currency

        # Make the API request and retrieve the conversion rate
        response=$(curl -s "https://api.exchangerate-api.com/v4/latest/$source_currency")
        conversion_rate=$(echo "$response" | jq -r ".rates.$target_currency")

        # Calculate the converted amount
        converted_amount=$(bc <<< "$amount * $conversion_rate")

        # Display the result to the user
        echo "$amount $source_currency = $converted_amount $target_currency"
        ;;
    2)
        # Make the API request to retrieve the latest exchange rates
        response=$(curl -s "https://api.exchangerate-api.com/v4/latest/USD")

        # Display the exchange rates to the user
        echo "Exchange Rates:"
        echo "$response" | jq -r ".rates | to_entries[] | \"\(.key): \(.value)\""
        ;;
    3)
        # Exit the script
        echo "Exiting..."
        exit 0
        ;;
    *)
        # Invalid choice
        echo "Invalid choice. Please select a valid option."
        ;;
esac

