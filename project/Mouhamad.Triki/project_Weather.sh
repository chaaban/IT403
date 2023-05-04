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
temp_kelvin=$(echo "$weather_data" | jq -r '.main.temp')
temp_celsius=$(printf "%.0f" "$(echo "scale=2; $temp_kelvin - 273.15" | bc)")
temp_fahrenheit=$(printf "%.0f" "$(echo "scale=2; $temp_celsius * 9/5 + 32" | bc)")
desc=$(echo "$weather_data" | jq -r '.weather[0].description')

# Use the city coordinates to get the local timezone
lat=$(echo "$weather_data" | jq -r '.coord.lat')
lon=$(echo "$weather_data" | jq -r '.coord.lon')
tz=$(TZ='UTC' date -d "$(curl -s "https://timezoneapi.io/api/ip/?${lat},${lon}" | jq -r '.data.datetime.date_time_utc')" +%Z)

# Get the current time for the specified location using the local timezone
time=$(TZ="$tz" date)

# Print the results to the user
echo "Current temperature in ${city}, ${country}: ${temp_celsius}°C / ${temp_fahrenheit}°F"
echo "Weather description: ${desc}"
echo "Current time in ${city}, ${country}: ${time}"
