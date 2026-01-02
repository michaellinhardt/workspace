#!/bin/bash

# Register events
sketchybar --add event window_focus \
           --add event windows_on_spaces

# Aerospace mode indicator (shows on active display only)
aerospace_mode=(
  script="$PLUGIN_DIR/aerospace_mode.sh"
  icon.font="$FONT:Bold:16.0"
  label.drawing=off
  icon.width=30
  icon=$YABAI_GRID
  icon.color=$ORANGE
  associated_display=active
)

sketchybar --add item aerospace.mode left \
           --set aerospace.mode "${aerospace_mode[@]}" \
           --subscribe aerospace.mode window_focus \
                                      windows_on_spaces \
                                      mouse.clicked

# Front app for display 1 (uses aerospace monitor 2)
front_app_1=(
  script="$PLUGIN_DIR/front_app_display.sh 2"
  icon.drawing=off
  padding_left=0
  label.color=$WHITE
  label.font="$FONT:Black:12.0"
  display=1
)

sketchybar --add item front_app.1 left \
           --set front_app.1 "${front_app_1[@]}" \
           --subscribe front_app.1 front_app_switched \
                                   aerospace_workspace_change \
                                   display_change \
                                   space_change

# Front app for display 2 (uses aerospace monitor 1)
front_app_2=(
  script="$PLUGIN_DIR/front_app_display.sh 1"
  icon.drawing=off
  padding_left=0
  label.color=$WHITE
  label.font="$FONT:Black:12.0"
  display=2
)

sketchybar --add item front_app.2 left \
           --set front_app.2 "${front_app_2[@]}" \
           --subscribe front_app.2 front_app_switched \
                                   aerospace_workspace_change \
                                   display_change \
                                   space_change
