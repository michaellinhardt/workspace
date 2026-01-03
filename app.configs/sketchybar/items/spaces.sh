#!/bin/bash

# CriticalElement style workspaces with multi-monitor support
# - Each workspace shows number + app names
# - Active workspace on each monitor gets highlighted with distinct colors
# - Main monitor: PINK, Secondary: GREEN, Third: ORANGE

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

# Register aerospace workspace change event
sketchybar --add event aerospace_workspace_change

# Create workspace items with background highlight support
for i in "${!SPACE_ICONS[@]}"
do
  sid=$((i+1))

  space=(
    icon=${SPACE_ICONS[i]}
    icon.font="$FONT:Bold:13.0"
    icon.color=$WHITE
    icon.highlight_color=$WHITE
    icon.align=left
    icon.padding_left=8
    icon.padding_right=2
    padding_left=2
    padding_right=2
    label.font="$FONT:Normal:11.0"
    label.color=$WHITE
    label.padding_left=0
    label.padding_right=6
    label.drawing=on
    label=""
    background.color=$TRANSPARENT
    background.height=24
    background.corner_radius=12
    background.drawing=on
    click_script="aerospace workspace $sid"
    script="$PLUGIN_DIR/aerospace.sh $sid"
  )

  sketchybar --add item space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid aerospace_workspace_change mouse.clicked
done

# Add new space button - CriticalElement style (DISABLED)
# sketchybar --add item new_space left                        \
#            --set      new_space icon.width=24               \
#                                 label.padding_right=2       \
#                                 icon.align=center           \
#                                 icon.padding_right=2        \
#                                 icon.padding_left=0         \
#                                 icon=+                      \
#                                 icon.color=$WHITE           \
#                                 background.drawing=off      \
#                                 label.drawing=off

# Bracket for space numbers - CriticalElement pink border pill
spaces_bracket=(
  background.color=$DARK_BG
  background.corner_radius=15
  background.border_width=1
  background.border_color=$PINK
  blur_radius=2
  background.height=30
  background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces_bracket[@]}"
