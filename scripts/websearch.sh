#!/bin/bash

# Get the search query from the user using Rofi
query=$(rofi -dmenu -p "Search the web:")

# Encode the query for use in the URL
encoded_query=$(echo "$query" | sed 's/ /+/g')

# Open Firefox and search for the query
firefox "https://duckduckgo.com/$encoded_query"

# Wait for Firefox to load the page
sleep 1

# Activate the Firefox window and switch to it
firefox_window=$(xdotool search --onlyvisible --class firefox)
xdotool windowactivate $firefox_window
xdotool windowfocus $firefox_window

