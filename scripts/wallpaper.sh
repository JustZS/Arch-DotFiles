#!/bin/sh

feh --bg-fill "$1"

wal -i "$1"

zathura-pywal

update_xresources.sh

dwmwalclr.sh

cd ~/.config/Programs/dwm/

sudo make clean install
