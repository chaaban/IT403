# Tic-Tac-Toe Bash Script

This is a simple command-line implementation of the Tic-Tac-Toe game using Bash scripting.

## How to Play

1. Make sure you have Bash installed on your system.
2. Download or copy the contents of the script into a file, e.g., `Tictactoc.sh`.
3. Open a terminal and navigate to the directory where the script is located.
4. Run the script using the following command:

   ```bash
   bash Tictactoc.sh
The game will display a 3x3 grid representing the Tic-Tac-Toe board, with numbered positions:

diff
Copy code
 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9
Players take turns entering their moves by selecting a number from 1 to 9.

The goal is to get three of your marks (X or O) in a row, column, or diagonal.

If all positions on the board are filled and no player has won, the game ends in a tie.

Gameplay
Player X always goes first, followed by Player O.
When it's your turn, you will be prompted to enter a number from 1 to 9.
Enter the desired position where you want to place your mark.
If the position is already taken, you will be asked to enter a different number.
The game will update the board and display the current state after each move.
If a player wins or the game ends in a tie, the final state of the board and a "Game over!" message will be displayed.
Sample Gameplay
sql
Copy code
$ bash Tictactoc.sh

 1 | 2 | 3
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9

Player X's turn. Enter a number from 1-9: 5

 1 | 2 | 3
---+---+---
 4 | X | 6
---+---+---
 7 | 8 | 9

Player O's turn. Enter a number from 1-9: 2

 1 | O | 3
---+---+---
 4 | X | 6
---+---+---
 7 | 8 | 9

...

Game over!
License
This project is licensed under the MIT License.
I used chatgpt to write this code.
