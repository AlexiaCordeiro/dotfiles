#!/bin/bash

set -e

connected_count=$(xrandr | grep -c " connected ")
primary_display=$(xrandr | grep -E "eDP[^ ]* connected " | awk '{print $1}')
secondary_display=$(xrandr | grep -E "HDMI[^ ]* connected " | awk '{print $1}')

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
