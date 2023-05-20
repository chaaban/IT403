#!/bin/bash
count=0
numberOfWords=0
typed=0

filname=words

read -p "Press Enter to Start: " start

start=$(date +%M:%S)
echo $start

startSeconds=$(echo $start | cut -d : -f2)
startMinutes=$(echo $start | cut -d : -f1)

end_time=$((SECONDS + 10))

while [ $SECONDS -lt $end_time ];
do
	let numberOfWords=numberOfWords+1
	
	line=$(shuf -n 1 $filname)
	echo $line

	echo "Enter your input:"
	read -t $((end_time - SECONDS)) word
	if [ $? -eq 0 ]
		then
			let typed=$typed+1
		
			if [ "$word" == $line ]
				then
					let count=$count+1
					echo $count
				fi
		else
			break
		fi
done
	
end=$(date +%M:%S)
echo $end

endSeconds=$(echo $end | cut -d : -f2)
endMinutes=$(echo $end | cut -d : -f1)

timeSeconds=$((10#$endSeconds - 10#$startSeconds))
timeMinutes=$((10#$endMinutes - 10#$startMinutes))

if [ $timeSeconds -lt 0 ]
	then
		time="$((timeMinutes - 1))":"$((60 + timeSeconds))"
		
	else
		time="$timeMinutes":"$timeSeconds"
	fi

finalSeconds=$(echo $time | cut -d : -f2)
echo "seconds: $finalSeconds"

finalMinutes=$(echo $time | cut -d : -f1)
echo "minutes: $finalMinutes"

totalSeconds=$(((10#$finalMinutes*60)+10#$finalSeconds))
echo "total seconds: $totalSeconds"

echo "you got $numberOfWords words, you typed $typed, $count of them are correct, it took you $totalSeconds seconds"

speed=$(((10#$numberOfWords*60)/10#$totalSeconds))
m=$((count*100))
accuracy=$((m/typed))

echo "your speed is $speed words per minute"
echo "your accuracy is: $accuracy%"
