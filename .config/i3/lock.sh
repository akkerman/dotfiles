#!/bin/bash

# make screenshot
scrot /tmp/lock_screen.png

# blurr the screenshot
convert /tmp/lock_screen.png -blur 8x8 /tmp/lock_screen.png

# Lock it up!
i3lock -e -f -c 000000 -i /tmp/lock_screen.png

# turn off screen after one minute if still locked
sleep 60 && pgrep i3lock && xset dpms force off
