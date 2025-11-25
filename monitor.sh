#!/bin/bash

set -e

connected_count=$(xrandr | grep -c " connected ")
primary_display=$(xrandr | grep -E "eDP[^ ]* connected " | awk '{print $1}')
secondary_display=$(xrandr | grep -E "HDMI[^ ]* connected " | awk '{print $1}')
lid_state=$(cat /proc/acpi/button/lid/LID/state | grep -oE "open|closed" | head -1)


lid_open=false

if [ "$lid_state" = "open" ]; then
    bspc monitor "${primary_display}" -d I II III IV V
    bspc monitor "${secondary_display}" -d VI VII VIII IX X
    bspc monitor "${secondary_display}" -s "${primary_display}"
    bspc wm --reorder-monitors "${secondary_display}" "${primary_display}"
else
    bspc monitor "${secondary_display}" -d I II III IV V
    bspc monitor "${primary_display}" --remove
    bspc monitor "${secondary_display}" -f
fi

if [ "$connected_count" -gt 1 ]; then
  if ! xrandr --output ${secondary_display} --primary --mode 1920x1080 --output ${primary_display} --mode 1920x1080 --left-of ${secondary_display} 2>/dev/null; then
        xrandr --auto
  fi
  notify-send "More than one monitor connected"
else
  xrandr --output ${primary_display} --primary --mode 1920x1080 --auto
  xrandr --listactivemonitors | grep -v "${primary_display}" | awk '/^ [0-9]:/ {print $4}' | xargs -I {} xrandr --output {} --off
  notify-send "One monitor connected"
fi
