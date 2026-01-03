#!/bin/bash

# CriticalElement style network down - blue accent
network_down=(
  icon=$NETWORK_DOWN
  icon.font="$FONT:Normal:14.0"
  icon.color=$PINK
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label="0 B/s"
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=10
  background.border_width=1
  background.border_color=$PINK
  background.padding_left=8
  blur_radius=2
  update_freq=2
  script="$PLUGIN_DIR/network_speed.sh"
)

sketchybar --add item network_down right \
           --set network_down "${network_down[@]}"
