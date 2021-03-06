#!/bin/bash

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  cmd="org.freedesktop.DBus.Properties.Get"
  domain="org.mpris.MediaPlayer2"
  path="/org/mpris/MediaPlayer2"

  meta=$(dbus-send --print-reply --dest=${domain}.spotify /org/mpris/MediaPlayer2 $cmd string:${domain}.Player string:Metadata)
  status=$(dbus-send --print-reply --dest=${domain}.spotify /org/mpris/MediaPlayer2 $cmd string:${domain}.Player string:PlaybackStatus | awk -F\" '/variant/ {print $2}')

  status=$(echo "$status" | sed 's/Playing//g;s/Paused//g')

  meta=$(echo "$meta" | sed 's:/:\\/:')
  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1 )
  album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1)
  title=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 )

  echo  $artist - $album - $title %{F#81a2be}${status}%{F-}

  # echo "${*:-%artist% - %title%}" | sed "s/%status%/$status/g;s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | sed 's/&/\\&/g'
}

main "$@"
