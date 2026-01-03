#!/bin/bash

# CriticalElement style network up - green accent
network_up=(
  icon=$NETWORK_UP
  icon.font="$FONT:Normal:14.0"
  icon.color=$GREEN
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label="0 B/s"
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$GREEN
  background.padding_left=18
  blur_radius=2
  update_freq=2
  script="$PLUGIN_DIR/network_speed.sh"
)

sketchybar --add item network_up right \
           --set network_up "${network_up[@]}"
