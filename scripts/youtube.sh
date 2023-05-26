#!/bin/bash

youtubeSearch=$(rofi -dmenu -p "Search:")

link=$(ytfzf -L $youtubeSearch)

dwmswallow $WINDOWID; mpv "$link"

