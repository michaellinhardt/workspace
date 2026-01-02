#!/bin/bash

headset=(
  icon=$HEADSET_DISCONNECTED
  icon.font="$FONT:Bold:14.0"
  icon.color=$GREY
  label.drawing=off
  padding_left=8
  padding_right=8
  script="$PLUGIN_DIR/headset.sh"
  update_freq=10
)

sketchybar --add item headset right \
           --set headset "${headset[@]}" \
           --subscribe headset system_woke
