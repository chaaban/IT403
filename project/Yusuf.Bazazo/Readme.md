# Rock Paper Scissors Game

This is a simple command-line Rock Paper Scissors game implemented in Bash. It allows a player to play against the computer and keeps track of the scores. The game continues until the player decides to end it.

# Prerequisites

To run this game, you need to have Bash installed on your system.

# Getting Started

Clone the repository or download the Bash script.
Open your terminal and navigate to the directory where the script is located.

# How to Play

1. Run the script by executing the following command:
bash project.sh

2. The game will display the current score as "Player X - Y Computer," where X is the player's score and Y is the computer's score.

3. Enter your move:

  -  Enter 1 for "rock."
  -  Enter 2 for "paper."
  -  Enter 3 for "scissors."
  -  Enter 0 to end the game.

4. After making your move, the game will display the player's choice and the computer's choice.

5. The game will determine the winner of the round and update the scores accordingly.

6. The game will continue until the player decides to end it by entering 0.

7. Once the game ends, the final score will be displayed, and the winner (or tie) will be announced.

# Gameplay Example

--------------------------------------------------------------
Current score: Player 0 - 0 Computer

Enter your move (1=rock, 2=paper, 3=scissors, 0=end game): 1
Player chose rock
Computer chose scissors
Player wins!

--------------------------------------------------------------
Current score: Player 1 - 0 Computer

Enter your move (1=rock, 2=paper, 3=scissors, 0=end game): 2
Player chose paper
Computer chose rock
Player wins!

--------------------------------------------------------------
Current score: Player 2 - 0 Computer

Enter your move (1=rock, 2=paper, 3=scissors, 0=end game): 3
Player chose scissors
Computer chose paper
Player wins!

--------------------------------------------------------------
Current score: Player 3 - 0 Computer

Enter your move (1=rock, 2=paper, 3=scissors, 0=end game): 0
Final score: Player 3 - 0 Computer
Player wins the game!
