#!/bin/bash

mpc --port 6601 del "$(mpc --port 6601 playlist | grep -n tmp.opus | cut -d ':' -f 1)"

youtubeSearch=$(rofi -dmenu -p "Search:")

link=$(ytfzf -L "$youtubeSearch")

yt-dlp -o "media/Music/tmp.%(ext)s" -x "$link"

mpc --port 6601 update

mpc --port 6601 add tmp.opus

lastSong=$(mpc --port 6601 playlist | wc -l)

mpc --port 6601 play $lastSong

