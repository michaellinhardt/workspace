#!/bin/bash

ethernet=(
  icon=$ETHERNET_CONNECTED
  icon.font="$FONT:Bold:14.0"
  icon.color=$BLUE
  label.drawing=off
  padding_left=8
  padding_right=8
  script="$PLUGIN_DIR/ethernet.sh"
  update_freq=10
)

sketchybar --add item ethernet right \
           --set ethernet "${ethernet[@]}" \
           --subscribe ethernet system_woke
