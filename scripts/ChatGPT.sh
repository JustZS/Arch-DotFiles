#!/bin/bash

test=$(mpc --port 6601 playlist | grep -n tmp.opus | cut -d ':' -f 1)

if [[ -n $test ]]; then
  mpc --port 6601 del $test
fi

youtubeSearch=$(rofi -dmenu -p "Search:")

link=$(ytfzf -L $youtubeSearch)

yt-dlp -o "media/Music/tmp.%(ext)s" -x "$link"

mpc --port 6601 update

mpc --port 6601 add tmp.opus

lastSong=$(mpc --port 6601 playlist | wc -l)

mpc --port 6601 play $lastSong

