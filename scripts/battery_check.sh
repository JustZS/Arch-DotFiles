#!/bin/sh 

status=$(acpi -b | awk '{print $3}' | sed s/,// | sed -n 1p)

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)' | sed s/,// | sed -n 1p)

if [ $battery_level -le 25 ] && [ "$status" != "Charging" ]; then 
            notify-send "Low Battery" "Your battery level is at $battery_level%. Please connect your charger."
fi

