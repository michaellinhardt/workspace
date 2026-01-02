#!/bin/bash

settings=(
  icon=$SETTINGS
  icon.font="$FONT:Bold:16.0"
  icon.color=$GREY
  label.drawing=off
  padding_left=8
  padding_right=8
  click_script="open -a 'System Settings'"
)

sketchybar --add item settings right \
           --set settings "${settings[@]}"
