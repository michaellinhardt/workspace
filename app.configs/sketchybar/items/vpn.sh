#!/bin/bash

# CriticalElement style vpn - grey accent when disconnected
vpn=(
  icon=$VPN_DISCONNECTED
  icon.font="$FONT:Normal:14.0"
  icon.color=$GREY
  icon.padding_left=12
  icon.padding_right=12
  label.drawing=off
  background.color=$DARK_BG
  background.height=30
  background.corner_radius=15
  background.border_width=1
  background.border_color=$GREY
  background.padding_left=18
  blur_radius=2
  script="$PLUGIN_DIR/vpn.sh"
  update_freq=10
)

sketchybar --add item vpn right \
           --set vpn "${vpn[@]}" \
           --subscribe vpn system_woke
