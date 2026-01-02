#!/bin/bash

volume=(
  icon=$VOLUME_100
  icon.font="$FONT:Bold:14.0"
  icon.color=$YELLOW
  label.font="$FONT:Semibold:12.0"
  padding_left=8
  padding_right=8
  script="$PLUGIN_DIR/volume.sh"
  update_freq=10
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change
