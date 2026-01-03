#!/bin/bash

# CriticalElement style cpu - magenta accent
cpu=(
  icon=󰍛
  icon.font="$FONT:Normal:14.0"
  icon.color=$MAGENTA
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label=0%
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$MAGENTA
  background.padding_left=18
  blur_radius=2
  update_freq=3
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
           --set cpu "${cpu[@]}"
