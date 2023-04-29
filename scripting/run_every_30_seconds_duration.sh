#!/bin/bash
# Set the duration in seconds (e.g., 600 seconds = 10 minutes)
duration=100

# Calculate the end time
# date +%s --> return seconds since 1 jan 1970 (Unix Timestamp aw POSIX Time)
end_time=$(( $(date +%s) + duration ))

while [ $(date +%s) -lt $end_time ]; do
  # Your command goes here
  echo "Running your command... $(date +%s)"

  
  # Sleep for 5 seconds
  sleep 5
done
