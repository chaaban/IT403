# Weather Script

This Bash script retrieves current weather data for a specified location using the OpenWeatherMap API.

## Prerequisites

- Bash
- curl
- jq

Ensure that you have the `curl` and `jq` commands installed on your system before running the script.

## Setup

1. Obtain an OpenWeatherMap API key by creating an account at [https://home.openweathermap.org/users/sign_up](https://home.openweathermap.org/users/sign_up).
2. Replace the placeholder `YOUR_API_KEY` with your actual API key in the script.

## Usage

1. Run the script using the command `./weather.sh`.
2. Enter the city name when prompted.
3. Enter the country code (e.g., US) when prompted.
4. Choose the temperature unit (C or F) when prompted.
5. The script will fetch the weather data using the OpenWeatherMap API and display the results.

## Example

$ ./weather.sh
Enter city name: London
Enter country code (e.g. US): GB
Enter temperature unit (C or F): C
Current weather in London, GB:
Temperature: 18°C
Weather description: Clear sky
Humidity: 68%
Wind speed: 3.13 m/s
Pressure: 1022 hPa
