#!/bin/bash

# CriticalElement style: Split date and time into separate pills

# Time item - blue accent (rightmost)
time_item=(
  icon=󱑎
  icon.font="$FONT:Normal:14.0"
  icon.color=$BLUE
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label="$(date '+%I:%M %p')"
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$BLUE
  background.padding_left=18
  blur_radius=2
  update_freq=1
  script="$PLUGIN_DIR/time.sh"
)

sketchybar --add item time right       \
           --set time "${time_item[@]}"

# Date item - green accent
date_item=(
  icon=󱨰
  icon.font="$FONT:Normal:14.0"
  icon.color=$GREEN
  icon.padding_left=12
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.padding_left=4
  label.padding_right=12
  label="$(date '+%a %b %d')"
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$GREEN
  background.padding_left=18
  blur_radius=2
  update_freq=10
  script="$PLUGIN_DIR/date.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item date right       \
           --set date "${date_item[@]}" \
           --subscribe date system_woke
