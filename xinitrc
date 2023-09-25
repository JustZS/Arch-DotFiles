#!/bin/sh

xrandr --output eDP-1 --brightness 0.4

~/.fehbg &
picom -b --experimental-backends
xbindkeys
[ ! -s ~/.config/mpd/pid ] && mpd
mpdas -c ~/.config/mpdasrc &
mpc &
dwmblocks &
songchange.sh &
dunst &

exec dwm

