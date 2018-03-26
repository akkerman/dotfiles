#!/bin/bash

OPTIONS=()
COMMANDS=()

declare -i index=0
OPTIONS[$index]="Cancel"
COMMANDS[$index]="true"

index+=1
OPTIONS[$index]="Two Screens"
COMMANDS[$index]="xrandr --output DVI-I-0 --auto --output DVI-D-0 --primary --auto --right-of DVI-I-0"

index+=1
OPTIONS[$index]="Left Screen Only"
COMMANDS[$index]="xrandr --output DVI-I-0 --primary --auto --output DVI-D-0 --off"

index+=1
OPTIONS[$index]="Right Screen Only"
COMMANDS[$index]="xrandr --output DVI-I-0 --off --output DVI-D-0 --primary --auto"

index+=1
OPTIONS[$index]="Clone"
COMMANDS[$index]="xrandr --output DVI-I-0 --auto --output DVI-D-0 --auto --same-as DVI-I-0"

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
