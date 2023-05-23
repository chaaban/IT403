#!/bin/bash
availability(){ #creating a function
echo "Enter a file that contains the list of urls.." #asking the user to input a file
read file_name #prompting the user to input file path and assigning it to a variable
exec 4< $file_name #opening the file to read from it 
	while read -u 4 line; do #while loop that access every line (url) (4 for descriptor of read)
		echo "Working on $line ..." #printing line of url working on

		response_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$line") #this line of code to get the http code from the url. More details about this command is in readme file
		case $response_code in #starting a case on the status code got from server
		2[0-9][0-9]) #case for a  request successfully received
			echo "$(date): $line is available (HTTP $response_code)"
			;;
		4[0-9][0-9]) #case for a request got a client error
			echo "$(date): There is a client error on $line (HTTP $response_code)" #printing current date i got the request and the reponse code i got on the url
			;;
		5[0-9][0-9]) #case for a request got a server error
			echo "$(date): There is a server error on $line (HTTP $response_code)"
			;;
		*) # the else case 
			echo "$(date): $line is unavailable (HTTP $response_code)" #probably the HTTP respose code would be 000
		esac # ending the case

		echo "---------------------------------" #seperating each work of a specific line (url)
	done # ending the while
exec 4<&- #closing the file that i read from it
}

availability #calling the function
