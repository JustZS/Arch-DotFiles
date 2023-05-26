#!/bin/bash

names=("erobb221" "brittt" "clintstevens")

twitchChannel=$(printf '%s\n' "${names[@]}" | rofi -dmenu -p "Which twitch channel:")

mpv https://www.twitch.tv/$twitchChannel
