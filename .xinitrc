feh --bg-scale ~/thing.jpg
picom --experimental-backends --animations -b
xrandr --output eDP --brightness 1
xbindkeys

while true; do
status=$(acpi -b | awk '{print $3}' | sed s/,// | sed -n 3p)
if [ "$status" = "Charging" ]; then
    icon="🌩️"
    else
        battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)' | sed s/,// | sed -n 1p)
        if [ $battery_level -le 10 ]; then
            icon="🔌"
        elif [ $battery_level -le 30 ]; then
            icon="🪫"
        else
            icon="🔋"
     fi
fi

volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/[%\]//g')

if [ $volume -eq 0 ]; then
    speak="🔇"
elif [ $volume -lt 30 ]; then
    speak="🔈"
    elif [ $volume -lt 70 ]; then
    speak="🔉"
    else
    speak="🔊"
    fi

xsetroot -name " $speak $(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/[%\]//g')% 📆 $(date "+%F") 🕤 $(date "+%I:%M:%S") $icon $(acpi -b | grep -P -o '[0-9]+(?=%)' | sed s/,// | sed -n 1p)%"
sleep 0.1s
done &

exec dwm
