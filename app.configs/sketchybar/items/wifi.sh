#!/bin/bash

wifi=(
  icon=$WIFI_CONNECTED
  icon.font="$FONT:Bold:14.0"
  icon.color=$BLUE
  label.drawing=off
  padding_left=8
  padding_right=8
  script="$PLUGIN_DIR/wifi.sh"
  update_freq=30
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change system_woke
