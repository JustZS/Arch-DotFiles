#!/bin/bash
printf "Sxiv.background: %s\nSxiv.foreground: %s\n" "$(sed -n '1p' ~/.cache/wal/colors)" "$(sed -n '5p' ~/.cache/wal/colors)" > ~/.Xresources
xrdb -merge ~/.Xresources

