# Tic-Tac-Toe Game with User Creation and Authentication

This is a simple command-line Tic-Tac-Toe game that includes user creation and authentication features.

## Prerequisites

- Bash shell
- sudo access (to run the script with elevated privileges)

## Getting Started

1. Clone the repository or download the source code files.

2. Open a terminal and navigate to the project directory.

3. Make the script executable by running the following command:

   ```bash
   chmod +x tictac.sh
   ```

4.  Run the script with elevated privileges using sudo:

    ```bash
    sudo ./tictac.sh
    ```

## Usage

1. Upon running the script, the main menu will be displayed, providing the following options:
   - Create a new user
   - Login with an existing user
   - Quit the game

2. If you choose to create a new user, you will be prompted to enter a username and password. Follow the on-screen instructions and provide the required information.

3. If you choose to login with an existing user, you will be prompted to enter your username and password. If the provided credentials are correct, you will be logged in, and the Tic-Tac-Toe game will start.

4. The game will be played on a 3x3 grid. Each player takes turns selecting a position on the grid to place their respective marker (X or O). The goal is to get three markers in a row horizontally, vertically, or diagonally.

5. The game will continue until there is a winner, a draw, or one of the players chooses to quit.

6. After the game ends, you will be prompted to either play again or return to the main menu.

## Credits

This Tic-Tac-Toe game was created by Youssof Hammoud. Feel free to contribute, report issues, or suggest improvements by opening an issue or submitting a pull request.