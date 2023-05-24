# Personal Finance Management Script

The Personal Finance Management Script is a simple Bash script for managing personal finance transactions. It allows you to add transactions, view transaction history, and calculate total expenses.


## Description

This script provides a command-line interface to manage personal finance transactions. It allows you to add new transactions with date, description, and amount. You can also view the transaction history and calculate the total expenses.

## How to Use

To use this script, follow the instructions below:
	first : run the script
	second: choose your option( add trans, view , calculate , quite)
	third : your trans will be saved in data_file that will have all your transactions and view your expenses
	 
### Prerequisites

- Bash is required to run this script.

### Setup

1. Clone the repository or download the `finance.sh` file to your local machine.

2. Open a terminal or command prompt and navigate to the directory where the `finance.sh` file is located.

3. Make the script executable by running the following command:

   ```shell
   chmod +x finance.sh
   ./finance.sh


## Usage

Run the script with the following command:

shell

./finance.sh

The script will display a main menu with the following options:

    Add a Transaction: Allows you to add a new transaction by providing the date, description, and amount.
    
    View Transactions: Displays the transaction history, showing the date, description, and amount of each transaction.
    
    Calculate Expenses: Calculates and displays the total expenses from all transactions.
    
    Quit: Exits the script.

Choose the desired option by entering the corresponding number and follow the prompts.


##Data File

	The script uses a data file named finance_data.txt to store the transaction details. If the file doesn't exist, the script will create it automatically in the same directory. Ensure that the script has write permissions in the directory where the script is located.

##Files

    finance.sh: The main script file containing the personal finance management functionality.

    finance_data.txt: The data file where the transactions are stored.
    
###Note:

1-this script is generated mostly by chatgpt 
