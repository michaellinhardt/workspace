#!/bin/bash

calendar=(
  icon=$CALENDAR
  icon.font="$FONT:Bold:14.0"
  icon.color=$GREEN
  icon.padding_right=8
  label.font="$FONT:Semibold:12.0"
  padding_left=10
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
