#!/bin/bash

ws_empty='.'

i3-msg workspace $ws_empty

# make screenshot of empty workspace
scrot /tmp/lock_screen.png

# blur the screenshot
convert /tmp/lock_screen.png -blur 16x9 /tmp/lock_screen.png

# lock screen
i3lock -e -f -c 000000 -i /tmp/lock_screen.png

# restore workspace, so after login not has changed
sleep 1; i3-msg workspace back_and_forth
