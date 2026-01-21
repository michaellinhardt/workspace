#!/bin/bash

# CriticalElement style: Split date and time into separate pills

# Time item - rightmost in group
time_item=(
  icon=󱑎
  icon.font="$FONT:Normal:13.0"
  icon.color=$PINK
  icon.padding_left=4
  icon.padding_right=4
  label.font="$FONT:Bold:14.0"
  label.color=$PINK
  label.padding_left=4
  label.padding_right=10
  label="$(date '+%H:%M')"
  background.drawing=off
  update_freq=1
  script="$PLUGIN_DIR/time.sh"
)

sketchybar --add item time right       \
           --set time "${time_item[@]}"

# Date item - calendar icon with day format 'Wed 21'
date_item=(
  icon=$CALENDAR
  icon.font="$FONT:Normal:11.0"
  icon.color=$PINK
  icon.padding_left=10
  icon.padding_right=4
  label.font="$FONT:Normal:14.0"
  label.color=$PINK
  label.padding_left=4
  label.padding_right=4
  label="$(date '+%a %d')"
  background.drawing=off
  update_freq=60
  script="$PLUGIN_DIR/date.sh"
)

sketchybar --add item date right       \
           --set date "${date_item[@]}" \
           --subscribe date system_woke
