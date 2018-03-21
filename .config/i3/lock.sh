#!/bin/bash

# I'm using feh to set the background image this leaves a .fehbg file in the home directory
# we can use this file to find one of the images in the background

# each of the images are put in between single quotes
# the awk command below splits each line in febg on single quotes
# making $2 the first image after the feh command

if [ -f $HOME/.fehbg ]; then
    # each of the images are put in between single quotes
    # the awk command below splits each line in febg on single quotes
    # making $2 the first image after the feh command
    WALLP=$(awk -F\' '/feh/ {print $2}' $HOME/.fehbg )

    # xdpyinfo spits out information about the x server
    # we're interested in the current resolution (dimensions)
    RESOLUTION=$(xdpyinfo | awk '/dimensions/ {print $2}')


    # resize and blur the wallpaper
    convert "$WALLP" -resize $RESOLUTION! -blur 16x9 /tmp/lock_screen.png
fi

# lock screen
i3lock -e -f -c 000000 -i /tmp/lock_screen.png

# screen off, music off if i3lock still running after 30 seconds
sleep 30 && pgrep i3lock && xset dpms force off && playerctl stop
