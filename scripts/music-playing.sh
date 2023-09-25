#!/bin/sh

floating=$(dwm-msg get_layouts | sed -n 's/.*"address": \([0-9]*\).*/\1/p' | sed -n '2p')

tiling=$(dwm-msg get_layouts | sed -n 's/.*"address": \([0-9]*\).*/\1/p' | sed -n '1p')

dwm-msg run_command setlayoutsafe $floating

st -g 100x35 fish -C "ncmpcpp; exit"

dwm-msg run_command setlayoutsafe $tiling

