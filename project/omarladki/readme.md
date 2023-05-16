The generate_code function generates a random code by looping through the code length and appending a random number between 1 and 6 to the code string.

The get_guess function prompts the player to enter their guess and keeps prompting them until they enter a valid guess, which is a four-digit string consisting only of numbers between 1 and 6.

The check_guess function takes a guess as an argument and checks it against the secret code. It loops through each digit in the guess and compares it to the corresponding digit in the secret code. If the digits match, it increments the correct variable. If the digit is not in the correct position but appears somewhere else in the secret code, it increments the misplaced variable. The function then prints out the number of correct and misplaced digits.

The main game loop starts by generating a secret code using the generate_code function. It then prompts the player for their guess using the get_guess function and checks it against the secret code using the check_guess function. If the guess is correct, the script congratulates the player and exits with a status code of 0. If the player runs out of attempts, the script prints the secret code and exits with a status code of 1.
