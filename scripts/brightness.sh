#!/bin/sh

INT_FILE="/tmp/int_value_brightness.txt"

if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")

brightness=$(xrandr --verbose --current | grep -i brightness | cut -f2 -d ' ')
scaled_brightness=$(echo "$brightness * 100" | bc)
rounded_brightness=$(printf "%.0f" "$scaled_brightness")

case $BLOCK_BUTTON in 
	1) notify-send "Brightness: $rounded_brightness%" ;;
	6) if [ "$int" -eq 0 ]; then
		int=1
	   else
		int=0
	   fi
	   echo "$int" > "$INT_FILE"
	   ;;
esac

case $int in
	0) echo "  💻" ;;
	1) echo " 💻 $rounded_brightness%" ;;
esac

