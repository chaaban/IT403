#!/bin/bash

# Set time interval to refresh every 5 seconds
INTERVAL=1

# Initialize total data usage to 0
TOTAL_MB=0

# Store start time
START_TIME=$(date +"%s")

# Function to handle Ctrl+C
function ctrl_c() {
  # Calculate elapsed time
  END_TIME=$(date +"%s")
  ELAPSED_TIME=$((END_TIME - START_TIME))

  # Calculate minutes and seconds
  MINUTES=$((ELAPSED_TIME / 60))
  SECONDS=$((ELAPSED_TIME % 60))

  # Print the total data usage and elapsed time
  echo "Total usage in $MINUTES minute(s) , $SECONDS seconds is: $TOTAL_MB MB"
  exit 0
}

# Trap Ctrl+C and call the ctrl_c function
trap ctrl_c INT

while true; do
  # Get the current time
  TIME=$(date +"%T")

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

    # Accumulate total data usage
    TOTAL_MB=$((TOTAL_MB + MB))

    # Print the time and the data used by each interface
    echo "$TIME Interface $INTERFACE usage: $MB MB"
  done

  # Wait for the specified interval
  sleep $INTERVAL
done
