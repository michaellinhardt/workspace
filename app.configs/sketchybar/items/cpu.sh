#!/bin/bash

# CriticalElement style cpu - magenta accent
cpu=(
  icon=󰍛
  icon.font="$FONT:Normal:16.0"
  icon.color=$PINK
  icon.padding_left=6
  icon.padding_right=2
  label.font="$FONT:Normal:14.0"
  label.color=$PINK
  label.padding_left=2
  label.padding_right=6
  label=0%
  background.drawing=off
  padding_left=0
  padding_right=0
  update_freq=3
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
           --set cpu "${cpu[@]}"
