#!/bin/bash

network_down=(
  icon=$NETWORK_DOWN
  icon.font="$FONT:Bold:14.0"
  icon.color=$BLUE
  label.font="$FONT:Bold:13"
  label="0 B/s"
  padding_left=4
  padding_right=8
  update_freq=2
  script="$PLUGIN_DIR/network_speed.sh"
)

sketchybar --add item network_down right \
           --set network_down "${network_down[@]}"
