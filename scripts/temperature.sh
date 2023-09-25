#!/bin/bash

response=$(curl -s 'https://forecast.weather.gov/MapClick.php?lat= &lon= ')

temperature=$(echo "$response" | grep -o '<p class="myforecast-current-lrg">[^<]*</p>' | sed -E 's/<[^>]*>|&deg;//g')
weather=$(echo "$response" | grep -o '<p class="myforecast-current">[^<]*</p>' | sed -E 's/<[^>]*>//g')

echo "$weather $temperature"

