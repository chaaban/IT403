# Hangman Game

The Hangman Game is a classic word-guessing game implemented in Bash. Challenge yourself by trying to guess the word within a limited number of incorrect guesses.

## How to Run

To play the Hangman Game, follow these steps:

1. Make sure you have Bash installed on your system.
2. Download the script file or clone this repository.
3. Open a terminal and navigate to the directory where the script is located.
4. Run the following command to start the game:

```bash
bash hangman.sh
Gameplay
The game randomly selects a word from a predefined list.
Your goal is to guess the word by suggesting letters, one at a time.
You have a maximum of 7 incorrect guesses before the game is over.
If you guess a letter correctly, it will be revealed in the word.
If you guess a letter that is not in the word, you will receive a message indicating it.
The hangman will be drawn progressively as you make incorrect guesses.
The game continues until you guess the word correctly or run out of guesses.
Example Output
Here's an example output of the Hangman Game:

less
Copy code
Guess the 5-letter word!
Guess a letter: a
A is in the word!
Word so far: A _ _ _ _

Guess a letter: e
E is NOT in the word. 6 incorrect guesses left.
   |
   O

Word so far: A _ _ _ _

Guess a letter: t
T is in the word!
Word so far: A _ T _ _

...

Contributing
Contributions to the Hangman Game project are welcome! If you have any improvements or new features to suggest, please follow these steps:

Fork the repository.
Create a new branch for your feature: git checkout -b feature-name.
Make your changes and commit them: git commit -m 'Add some feature'.
Push to the branch: git push origin feature-name.
Submit a pull request detailing your changes.
License
This project is licensed under the MIT License.
