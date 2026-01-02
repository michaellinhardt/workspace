#!/bin/bash

cpu=(
  icon=󰍛
  icon.font="Hack Nerd Font:Regular:14.0"
  icon.color=$BLUE
  label.font="$FONT:Semibold:12"
  label=0%
  padding_left=8
  padding_right=8
  update_freq=3
  script="$PLUGIN_DIR/cpu.sh"
)

sketchybar --add item cpu right \
           --set cpu "${cpu[@]}"
