#!/bin/sh

INT_FILE="/tmp/int_value_wifi.txt"

# Initialize int with 0 if the file doesn't exist
if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")


if [[ $(nmcli -t -f DEVICE,STATE dev | grep '^w' | awk -F':' '{print $2}') = 'connected' ]]; then
    emoji='' # Use WiFi symbol emoji
    network=$(nmcli | sed -n '1p' | awk '{print $4}')
else
    if [[ $(nmcli -t -f DEVICE,STATE dev | grep '^e' | awk -F':' '{print $2}') = 'connected' ]]; then
        emoji='🌐'
        network=$(nmcli | sed -n '1p' | awk '{print $4}')
    else
        emoji='❗' 
        network='Not connected'
    fi
fi

case $BLOCK_BUTTON in
	1) notify-send "Wifi Network" "$emoji $network" ;;	
	3) rofi-wifi-menu.sh >/dev/null 2>&1 ;;
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
	1) echo " $emoji  $network" ;;
esac
