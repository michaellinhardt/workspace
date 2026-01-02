#!/bin/bash

battery_icon=(
  icon=󰁹
  icon.font="Hack Nerd Font:Regular:14.0"
  icon.color=$GREEN
  label.drawing=off
  padding_left=8
  padding_right=0
  y_offset=6
  width=0
)

battery_percent=(
  label.font="$FONT:Semibold:12"
  label=100%
  icon.drawing=off
  padding_left=8
  padding_right=8
  y_offset=-6
  update_freq=120
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery.icon right \
           --set battery.icon "${battery_icon[@]}" \
           \
           --add item battery.percent right \
           --set battery.percent "${battery_percent[@]}" \
           --subscribe battery.percent power_source_change system_woke
