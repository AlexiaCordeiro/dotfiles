#!/bin/bash

capslock() {
  caps=$(xset -q | grep Caps | awk '{ print $4 }')
  
  if [ "$caps" = 'off' ]; then
    echo "󰌌"  # Caps off
  else
    echo "󰘲"  # Caps on
  fi
}

numlock() {
  num=$(xset -q | grep Num | awk '{ print $8 }')
  
  if [ "$num" = 'off' ]; then
    echo ""  # Num off
  else
    echo ""  # Num on
  fi
}

scrolllock() {
  scroll=$(xset -q | grep Scroll | awk '{ print $12 }')
  
  if [ "$scroll" = 'off' ]; then
    echo ""  # Scroll off
  else
    echo ""  # Scroll on
  fi
}

case "$1" in
  -c) capslock ;;
  -n) numlock ;;
  -s) scrolllock ;;
  *) echo "Usage: $0 {-c|-n|-s}" ;;
esac
