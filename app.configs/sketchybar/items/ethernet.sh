#!/bin/bash

# CriticalElement style ethernet - blue accent
ethernet=(
  icon=$ETHERNET_CONNECTED
  icon.font="$FONT:Normal:14.0"
  icon.color=$PINK
  icon.padding_left=12
  icon.padding_right=12
  label.drawing=off
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=10
  background.border_width=1
  background.border_color=$PINK
  background.padding_left=8
  blur_radius=2
  script="$PLUGIN_DIR/ethernet.sh"
  update_freq=10
)

sketchybar --add item ethernet right \
           --set ethernet "${ethernet[@]}" \
           --subscribe ethernet system_woke
