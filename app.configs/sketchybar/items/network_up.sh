#!/bin/bash

network_up=(
  icon=$NETWORK_UP
  icon.font="$FONT:Bold:14.0"
  icon.color=$GREEN
  label.font="$FONT:Semibold:12"
  label="0 B/s"
  padding_left=8
  padding_right=4
  update_freq=2
  script="$PLUGIN_DIR/network_speed.sh"
)

sketchybar --add item network_up right \
           --set network_up "${network_up[@]}"
