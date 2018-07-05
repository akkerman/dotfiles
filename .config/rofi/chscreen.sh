#!/bin/bash

OPTIONS=()
COMMANDS=()

declare -i index=0
OPTIONS[$index]="--- right -->"
COMMANDS[$index]="xrandr --output eDP-1 --auto --output DP-1 --primary --auto --right-of eDP-1"

index+=1
OPTIONS[$index]="<-- left ----"
COMMANDS[$index]="xrandr --output eDP-1 --auto --output DP-1 --primary --auto --left-of eDP-1"

index+=1
OPTIONS[$index]="off"
COMMANDS[$index]="xrandr --output eDP-1 --primary --auto --output DP-1 --off"

index+=1
OPTIONS[$index]="clone"
COMMANDS[$index]="xrandr --output eDP-1 --mode 1920x1080 --output DP-1 --mode 1920x1080 --same-as eDP-1"

function echo_options()
{
    for i in $(seq 0 $(( ${#OPTIONS[@]} -1 )))
    do
        echo $i ${OPTIONS[i]}
    done
}

SEL=$( echo_options | rofi -dmenu -lines ${#OPTIONS[@]} -p "Monitor Setup:" -a 0 -no-custom | awk '{print $1}' )

# Change monitor Setup
$( ${COMMANDS[$SEL]} )
