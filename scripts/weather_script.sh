#!/bin/bash

LOCATION="Tacoma"
INT_FILE="/tmp/int_value_weather.txt"
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
WEATHER_CACHE="$CACHE_DIR/weatherreport"

temperature=$(awk '{print $NF}' "$WEATHER_CACHE")
condition=$(awk '{$NF=""; print $0}' "$WEATHER_CACHE" | awk '{$1=$1;print}')

get_weather_emoji() {
  case $1 in
    *"Sunny"*) echo "🌞" ;;
    *"Overcast"*) echo "☁" ;;
    *"Rain"*) echo "🌧" ;;
    *"Drizzle"*) echo "🌧️" ;;
    *"Thunderstorm"*) echo "🌩️" ;;
    *"Snow"*) echo "🌨️" ;;
    *"Partly Cloudy"*) echo "🌤" ;;
    *"Clear"*) echo "🟦" ;;
    *"haze"*) echo "💨" ;;
    *"Light Rain"*) echo "🌧" ;;
    *"Mostly Cloudy"*) echo "🌥" ;;
    *"light rain,mist"*) echo "🌧" ;;
    *"Mist"*) echo "🌧" ;;
    *"Fog"*) echo "🌫" ;;
    *) echo "🌍" ;;
  esac
}

emoji=$(get_weather_emoji "$condition")

if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")

case $BLOCK_BUTTON in
    1) temp.sh; notify-send "Weather in $LOCATION" "$emoji $condition $temperature" ;;
    3) st fish -C "curl -s wttr.in; read; exit" ;;
    6) if [ "$int" -eq 0 ]; then
    	    int=1
       else
    	    int=0
       fi
       echo "$int" > "$INT_FILE"
       ;;
esac

case $int in
    0) echo " $emoji" ;;
    1) echo " $emoji $temperature" ;;
esac

