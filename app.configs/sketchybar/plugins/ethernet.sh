#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

# Check ethernet status by looking for active en0 (usually ethernet) or Thunderbolt interfaces
ETHERNET_STATUS=$(ifconfig en0 2>/dev/null | grep "status: active")

# Also check for Thunderbolt ethernet adapters (en1-en9)
if [ -z "$ETHERNET_STATUS" ]; then
  for i in 1 2 3 4 5 6 7 8 9; do
    ETHERNET_STATUS=$(ifconfig en$i 2>/dev/null | grep "status: active")
    if [ -n "$ETHERNET_STATUS" ]; then
      break
    fi
  done
fi

if [ -n "$ETHERNET_STATUS" ]; then
  ICON=$ETHERNET_CONNECTED
  COLOR=$PINK
else
  ICON=$ETHERNET_DISCONNECTED
  COLOR=$GREY
fi

sketchybar --set $NAME icon=$ICON icon.color=$COLOR
