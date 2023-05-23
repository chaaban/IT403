#Wesbite Availability Monitor
It checks the availability of a website by sending an HTTP request and geting the response code.
The script works on HTTP and HTTPS urls.

##How to Use
Run the code using "bash +x website_availability.sh". Then the script should ask you to enter the file path that contains a list of urls you need to check for availability. Make sure every line in the file contains a url to test it. 

##More about the code
Comments are enough to explain the code, but still some details are needed for more clarification.

###**curl** Command Line
In the curl command line is to make the request and retrieve the HTTP response code.
"-L": option is for redirection of response. Ot means that go to that redirected link again and test it.
"-s": to run in silent mode. Prevents error messages, for unnecessary output.
"-o /dev/null": redirects the output to null device. To only take the response code.
"-w %{http_code}": for getting only the response code, without the response content.
###Cases
Success: Response code 200-299 indicates that request was successfully received or accepted by the server, for example.
Client errors: Response code 400-499 indicates that the client made a mistake.
Server errors: Response code 500-599 indicates that the error is on the server side while processing the request.
Redirection (not used as a case): I considered this section by adding the "-L" option in the curl command line. Where i go to the redirected link and get the response code. (300-399)

##Benefit
The website availability monitor script is beneficial as it helps track and ensure the continuous accessibility of websites, improving user experience and identifying potential issues promptly. Also this code could be modified to test the availability every day using a while loop and a "sleep" section, with sending an email. Where I check my email at morning to see what's up as a server!


##Resources
```
URL="http://www.example.com"  # Replace with your website URL
TIMEOUT=10  # Request timeout in seconds
SLEEP_INTERVAL=60  # Interval between checks in seconds

while true; do
  response=$(curl --write-out %{http_code} --silent --output /dev/null --max-time $TIMEOUT $URL)
  
  if [ $response -eq 200 ]; then
    echo "$(date): Website is available"
  else
    echo "$(date): Website is not available (HTTP response code: $response)"
  fi
  
  sleep $SLEEP_INTERVAL
done

```
I found this block of code on chatgpt. I test it first, then I started modifying until it meets my needs. The most line of code I benefit from is the line using **curl** command, where it was a good experience dealing with data exchange between a device and a server!

