#!/bin/bash

vpn=(
  icon=$VPN_DISCONNECTED
  icon.font="$FONT:Bold:14.0"
  icon.color=$GREY
  label.drawing=off
  padding_left=8
  padding_right=8
  script="$PLUGIN_DIR/vpn.sh"
  update_freq=10
)

sketchybar --add item vpn right \
           --set vpn "${vpn[@]}" \
           --subscribe vpn system_woke
