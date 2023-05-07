#!/bin/bash

# Replace YOUR_API_KEY with your own OpenWeatherMap API key
API_KEY=2962dd9221930175241256d4305697aa

# Prompt the user to enter a city name and country code
echo "Enter city name: "
read city
echo "Enter country code (e.g. US): "
read country

# Prompt the user to choose a temperature unit
echo "Enter temperature unit (C or F): "
read unit

# Use curl to get the weather data for the specified location
url="https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${API_KEY}"
weather_data=$(curl -s "$url")

# Parse the JSON response to get the current weather data
temp=$(echo "$weather_data" | jq -r '.main.temp')
if [ "$unit" == "F" ]; then
  temp=$(printf "%.0f" "$(echo "scale=2; ($temp - 273.15) * 9/5 + 32" | bc)")
  unit="°F"
else
  temp=$(printf "%.0f" "$(echo "scale=2; $temp - 273.15" | bc)")
  unit="°C"
fi
desc=$(echo "$weather_data" | jq -r '.weather[0].description')
humidity=$(echo "$weather_data" | jq -r '.main.humidity')
wind_speed=$(echo "$weather_data" | jq -r '.wind.speed')
pressure=$(echo "$weather_data" | jq -r '.main.pressure')

# Print the results to the user
echo "Current weather in ${city}, ${country}:"
echo "  Temperature: ${temp}${unit}"
echo "  Weather description: ${desc}"
echo "  Humidity: ${humidity}%"
echo "  Wind speed: ${wind_speed} m/s"
echo "  Pressure: ${pressure} hPa"
