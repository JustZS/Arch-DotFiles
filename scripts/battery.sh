#!/bin/bash

INT_FILE="/tmp/int_value_bat.txt"

if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")

notification_file="/tmp/low_battery_notification.txt"

acpi_output=$(acpi)
status=$(echo "$acpi_output" | awk '{print $3}' | sed 's/,//')
battery_level=$(echo "$acpi_output" | grep -P -o '[0-9]+(?=%)' | sed 's/,//')

case "$status" in
    "Charging")
        icon="🔌"
        [[ -f "$notification_file" ]] && rm -f "$notification_file" ;;
    "Not")
        icon="🚫" ;;
    *)
        if (( $battery_level <= 25 )); then
            icon="🪫"
            [[ ! -f "$notification_file" ]] && {
                notify-send -u critical "Low Battery" "Your battery level is at $battery_level%. Please connect your charger."
                touch "$notification_file"
            }
        else
            icon="🔋"
            [[ -f "$notification_file" ]] && rm -f "$notification_file"
        fi ;;
esac

case $BLOCK_BUTTON in
    1) notify-send "Battery" "$(acpi)" ;;
    6) if [ "$int" -eq 0 ]; then
    	    int=1
       else
    	    int=0
       fi
       echo "$int" > "$INT_FILE"
       ;;

esac

case $int in 
	0) echo "$icon" ;;
	1) echo "$icon $battery_level%" ;;
esac

