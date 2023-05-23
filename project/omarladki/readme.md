# Mastermind Game in Bash    
This is a simple implementation of the Mastermind game in Bash scripting.

# Game Description      
In the Mastermind game, the player attempts to guess a secret code within a limited number of attempts. The code consists of four digits, and each digit can range from 1 to 6. After each guess, the player receives feedback indicating the number of correct and misplaced digits.

# Prerequisites       
To run this game, you need to have a Bash environment set up on your machine.

# How to Run    
Save the provided code in a file with a .sh extension (e.g., mastermind.sh).     
Open a terminal or command prompt.     
Navigate to the directory where the script is saved.      
Run the script by executing the following command:      
bash mastermind.sh      


# Gameplay Instructions       
When the game starts, you will be greeted with a welcome message.        
A secret code consisting of four digits will be generated.        
You need to guess the code within a limited number of attempts. The default is 10 attempts, but you can modify it in the script.        
Enter your guess as a four-digit number, where each digit should be between 1 and 6.         
After each guess, you will receive feedback on the accuracy of your guess.        
The "Correct" value indicates the number of correctly placed digits.         
The "Misplaced" value indicates the number of digits that are correct but not in the right position.                   
Keep guessing and using the feedback to improve your subsequent guesses.                     
If you guess the code correctly within the given attempts, you win the game.                       
If you exhaust all your attempts without guessing the code correctly, you lose the game.                     
Example Output                                       
Welcome to Mastermind!                     
Attempt 1 of 10:                            
Enter your guess (4 digits from 1-6): 2451                             
Correct: 1   Misplaced: 1                           
Attempt 2 of 10:                    
Enter your guess (4 digits from 1-6): 3612                         
Correct: 0   Misplaced: 3                          
...                            
Congratulations, you guessed the code!                          

# Customization                         
You can modify the code_length variable in the script to change the length of the secret code.                                
You can adjust the max_attempts variable to set the maximum number of attempts allowed.                       

*__Enjoy playing Mastermind in the Bash environment!__*
