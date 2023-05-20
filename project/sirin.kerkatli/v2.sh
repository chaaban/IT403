#!/bin/bash

count=0
numberOfWords=0
filename="words"

read -p "Press Enter to start: " start
#start=$(date +%M:%S)
echo $date

echo $SECONDS

end_time=$((SECONDS + 15))
echo $end_time

timeout $end_time bash -c 'exit'

exec 3< "$filename"

#timeout 5 bash -c 'echo time expired'

while [ $SECONDS -lt $end_time ] && IFS= read -r line <&3; do
    let numberOfWords=numberOfWords+1
    echo "$line"
    echo "Enter your input:"
    
    
    # Execute the read command with timeout
    read -t $((end_time - SECONDS)) word
   

    # Check if the timeout occurred
    if [ $? -eq 0 ]; then
        # The user entered input within the timeout duration
        if [ "$word" == "$line" ]; then
            let count=$count+1
            echo $count
        fi
    else
        # The timeout occurred, do something
        echo "Timeout reached. Exiting... $? "
        break
    fi
done

end=$(date +%M:%S)
echo $end
