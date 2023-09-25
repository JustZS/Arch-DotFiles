#!/bin/sh

INT_FILE="/tmp/int_value_date.txt"

# Initialize int with 0 if the file doesn't exist
if [ ! -f "$INT_FILE" ]; then
    echo "0" > "$INT_FILE"
fi

int=$(cat "$INT_FILE")

case $BLOCK_BUTTON in
	1) clock.sh ;;
	2) st fish -C "tty-clock -scbtD; exit" ;;
	6) if [ "$int" -eq 0 ]; then
    		int=1
 	   else
    		int=0
  	   fi
	   echo "$int" > "$INT_FILE"
	   ;;
esac

case $int in 
	0) echo " 🕛" ;;
	1) echo " 🕢 $(date "+%I:%M:%S")" ;;
esac

