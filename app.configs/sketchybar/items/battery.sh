#!/bin/bash

# CriticalElement style battery - red accent
battery=(
  icon=
  icon.font="$FONT:Normal:14.0"
  icon.color=$RED
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label="--%"
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$RED
  background.padding_left=18
  blur_radius=2
  update_freq=20
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
