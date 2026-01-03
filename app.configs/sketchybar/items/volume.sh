#!/bin/bash

# CriticalElement style volume - yellow accent
volume=(
  icon=$VOLUME_100
  icon.font="$FONT:Normal:14.0"
  icon.color=$PINK
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=10
  background.border_width=1
  background.border_color=$PINK
  background.padding_left=8
  blur_radius=2
  script="$PLUGIN_DIR/volume.sh"
  update_freq=10
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change
