#!/bin/bash

battery=(
  icon=󰁹
  icon.font="Hack Nerd Font:Regular:14.0"
  icon.color=$GREEN
  label.font="$FONT:Semibold:12"
  label=100%
  padding_left=8
  padding_right=8
  update_freq=120
  script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
