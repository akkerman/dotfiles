#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

PRIMARY_DISPLAY="$(xrandr -q | grep " connected primary" | cut -d' ' -f1)"
SECONDARY_DISPLAY="$(xrandr -q | grep " connected" | grep -v "primary" | cut -d' ' -f1)"

if [[ -z "$PRIMARY_DISPLAY" ]]; then
    # in case there is no primary display and there is possibly a 'default' display
    # swap the content of the variables
    read PRIMARY_DISPLAY SECONDARY_DISPLAY <<< "$SECONDARY_DISPLAY $PRIMARY_DISPLAY"
fi

if [[ -z "$PRIMARY_DISPLAY" ]]; then
    echo "primary  : NONE"
else
    echo "primary  : $PRIMARY_DISPLAY"
    MONITOR="$PRIMARY_DISPLAY" polybar primary &
fi

if [[ -z $SECONDARY_DISPLAY ]]; then
    echo "secondary: NONE"
else
    echo "secondary $SECONDARY_DISPLAY"
    MONITOR="$SECONDARY_DISPLAY" polybar secondary &
fi

echo "Bars launched..."
