#!/bin/bash

# Set time interval to refresh every 5 seconds
INTERVAL=5

# Initialize data usage to 0
TOTAL_MB=0
START_TOTAL=0
END_MB=0

# Store start time
START_TIME=$(date +"%s")

 # Get network interfaces
  INTERFACES1=$(ifconfig -s | cut -d ' ' -f 1 | sed '1d')

# Check each interface
 for INTERFACE in $INTERFACES1; do
   # Skip the loopback interface
    if [ $INTERFACE == "lo" ]; then
      continue
    fi

    # Get the amount of data at the begining
    START_DATA=$(ifconfig $INTERFACE | grep -i "rx pac" | awk '{print $5}')
    # Get data in MB
    START_MB=$((START_DATA/1000000))
    #Get total data from all interfaces
    START_TOTAL=$((START_TOTAL + START_MB))
done

# Function to handle Ctrl+C
function ctrl_c() {
  # Calculate elapsed time
  END_TIME=$(date +"%s")
  ELAPSED_TIME=$((END_TIME - START_TIME))

  # Calculate minutes and seconds
  MINUTES=$((ELAPSED_TIME / 60))
  SECONDS=$((ELAPSED_TIME % 60))
  
  #Calculate total usage
  TOTAL_MB=$((END_MB - START_TOTAL))
  # Print the total data usage and elapsed time
  echo "Total usage in $MINUTES minute(s) , $SECONDS seconds is: $TOTAL_MB MB"
  exit 0
}

# Trap Ctrl+C and call the ctrl_c function
trap ctrl_c INT

while true; do
  # Get the current time
  TIME=$(date +"%T")
  # Initialize total end data usage to 0
  END_TOTAL=0
  # Get network interfaces
  INTERFACES=$(ifconfig -s | cut -d ' ' -f 1 | sed '1d')

  # Check each interface
  for INTERFACE in $INTERFACES; do
    # Skip the loopback interface
    if [ $INTERFACE == "lo" ]; then
      continue
    fi

    # Get the amount of data
    DATA=$(ifconfig $INTERFACE | grep -i "rx pac" | awk '{print $5}')

    # Get data in MB
    MB=$((DATA/1000000))

    #Get total end data from all interfaces
    END_TOTAL=$((END_TOTAL + MB))

    # Print the time and the data used by each interface
    echo "$TIME Interface $INTERFACE usage: $MB MB"
  done

  # Wait for the specified interval
  sleep $INTERVAL
  
  #Capture final data usage from all interfaces
  END_MB=$END_TOTAL

done
