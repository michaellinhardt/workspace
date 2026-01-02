#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

WIFI_STATUS=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null)

if echo "$WIFI_STATUS" | grep -q "AirPort: Off"; then
  ICON=$WIFI_DISCONNECTED
  COLOR=$RED
elif echo "$WIFI_STATUS" | grep -q " SSID:"; then
  ICON=$WIFI_CONNECTED
  COLOR=$BLUE
else
  ICON=$WIFI_DISCONNECTED
  COLOR=$GREY
fi

sketchybar --set $NAME icon=$ICON icon.color=$COLOR
