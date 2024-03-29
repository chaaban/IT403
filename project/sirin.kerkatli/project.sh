#!/bin/bash

#start all counters at zero
count=0
numberOfWords=0
typed=0

#get the file that stores the words
filname=words

#start the game
read -p "Press Enter to Start: " start

#starting time
start=$(date +%M:%S)
echo $start

#game should stop after 60 seconds
end_time=$((SECONDS + 60))

#keep going until the 60 seconds are over
while [ $SECONDS -lt $end_time ];
do
	#get a random word every time the loop is entered
	line=$(shuf -n 1 $filname)
	echo $line

	#number of words provided
	let numberOfWords=numberOfWords+1
	
	read -t $((end_time - SECONDS)) -p "you: " word
	if [ $? -eq 0 ]
		then
			#number of words the user typed
			let typed=$typed+1
		
			if [ "$word" == $line ]
				then
					#number of correct words 
					let count=$count+1
				fi
		else
			break
		fi
done
	
#ending time
end=$(date +%M:%S)
echo $end

#results calculation
m=$((count*100))
accuracy=$((m/typed))

#results presentation
echo "speed: $typed words per minute"
echo "accuracy: $accuracy%"
echo -e "words provided: $numberOfWords\nwords typed: $typed\ncorrect words: $count"

