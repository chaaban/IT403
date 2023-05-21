#!/bin/bash

# Prompt the user to enter the website name
read -p "Enter website name: " website_name

# Use dig to retrieve the website's IP address
website_ip=$(dig +short $website_name)

# Check if the IP address was retrieved successfully
if [ -z "$website_ip" ]; then # Check if website_ip is empty
  echo "Unable to retrieve IP address for $website_name" 
  exit 1
fi

# Use curl to query the ipapi.com API for the location information
response=$(curl -s "https://ipapi.co/$website_ip/json/") # Query the ipapi.com API in Silent mode

# Check if the response was retrieved successfully
if [ -z "$response" ]; then # Check if response is empty
  echo "Unable to retrieve location information for $website_name"
  exit 1
fi


# Extract the location information from the response and print it out


echo "Location information for $website_name ($website_ip)"
echo "----------------------------------------------------"
echo "Country: $(echo $response | jq -r '.country_name')" #Extract the country name and print it out
echo "Region: $(echo $response | jq -r '.region')" #Extract the region and print it out
echo "City: $(echo $response | jq -r '.city')" #Extract the city name and print it out
echo "Latitude: $(echo $response | jq -r '.latitude')" #Extract the latitude and print it out
echo "Longitude: $(echo $response | jq -r '.longitude')" #Extract the longitude and print it out
echo "----------------------------------------------------"

