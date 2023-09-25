#!/bin/sh

INT_FILE="/tmp/int_value_cal.txt"

if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")

case $BLOCK_BUTTON in
	1) notify-send -t 60000000 "Calendar" "$(cal | sed -r "s/(^|[^0-9])($(date +'%e'))([^0-9]|$)/\1<span foreground='red'>\2<\/span>\3/g") <b>$(date +'%A')</b>" ;;
	3) st fish -C "calcure; exit" ;;
	6) if [ "$int" -eq 0 ]; then
    		int=1
 	   else
    		int=0
  	   fi
	   echo "$int" > "$INT_FILE"
	   ;;
esac

case $int in
	0) echo " 📅" ;;
	1) echo " 📅 $(date "+%D")" ;;
esac

