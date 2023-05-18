# Currency Converter

This is a bash script that uses a currency conversion API to convert an amount from one currency to another. The script prompts the user for the amount, source currency code, and target currency code, and then performs the conversion using the API.

## Prerequisites

- Bash (compatible with most Unix-based systems)
- `curl` command-line tool
- `jq` command-line tool

## Usage

1. Open a terminal.
2. Clone the repository or download the `currency_converter.sh` script.
3. Ensure that the script has execute permissions. If not, run the following command: `chmod +x currency_converter.sh`.
4. Run the script by executing the following command: `./currency_converter.sh`.
5. Choose from the available options:
   - Option 1: Convert amount - Enter the amount, source currency code, and target currency code to convert the amount.
   - Option 2: View exchange rates - Displays the latest exchange rates for USD.
   - Option 3: Exit - Exits the script.
6. Follow the prompts and view the conversion or exchange rates as required.

## API Usage

This script utilizes the [exchangerate-api.com](https://www.exchangerate-api.com) API to fetch the currency conversion rates. Please note that an internet connection is required for the script to access the API.

## License

This project is licensed under the [MIT License](LICENSE).
