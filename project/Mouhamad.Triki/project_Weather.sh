#!/bin/bash

# Replace YOUR_API_KEY with your own OpenWeatherMap API key
API_KEY=1d16bb055372bbf5e8239eabc91117cd

# Prompt the user to enter a city name and country code
echo "Enter city name: "
read city
echo "Enter country code (e.g. US): "
read country

# Use curl to get the weather data for the specified location
url="https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${API_KEY}"
weather_data=$(curl -s "$url")

# Parse the JSON response to get the current temperature and weather description
temp_k=$(echo "$weather_data" | jq -r '.main.temp')
desc=$(echo "$weather_data" | jq -r '.weather[0].description')

# Convert temperature to Fahrenheit and Celsius
temp_f=$(echo "scale=2; ($temp_k - 273.15) * 9/5 + 32" | bc)
temp_c=$(echo "scale=2; ($temp_k - 273.15)" | bc)

# Print the results to the user
echo "Current weather conditions in ${city}, ${country}:"
echo "Temperature: ${temp_f}°F / ${temp_c}°C"
echo "Weather description: ${desc}"
