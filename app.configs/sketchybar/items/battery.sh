#!/bin/bash

# CriticalElement style battery - red accent
battery=(
  icon=
  icon.font="$FONT:Normal:16.0"
  icon.color=$PINK
  icon.padding_left=18
  icon.padding_right=2
  label.font="$FONT:Normal:14.0"
  label.color=$PINK
  label.padding_left=2
  label.padding_right=6
  label="--%"
  background.drawing=off
  padding_left=0
  padding_right=0
  update_freq=3
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
