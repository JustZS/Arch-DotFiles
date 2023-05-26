#!/bin/bash

QUERY=$(rofi -dmenu -p "Find file:" < <(find ~ -type f -iname "*$1*" -not -path "*/\.git/*" -not -path "*/\node_modules/*" -printf "%P\n"))

if [[ -n "$QUERY" ]]; then
  FILE_EXT="${QUERY##*.}"
  case "$FILE_EXT" in
    mp4|mp3|avi)
      dwmswallow $WINDOWID; mpv "$HOME/$QUERY" 
      ;;
    pdf|djvu|epub)
      dwmswallow $WINDOWID; zathura "$HOME/$QUERY"
      ;;
    *)
      xdg-open "$HOME/$QUERY"
      ;;
  esac
fi

