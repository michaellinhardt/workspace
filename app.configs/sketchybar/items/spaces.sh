#!/bin/bash

# Always display all 9 workspaces
SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9")

# Register aerospace workspace change event
sketchybar --add event aerospace_workspace_change

for i in "${!SPACE_ICONS[@]}"
do
  sid=$((i+1))

  space=(
    icon=${SPACE_ICONS[i]}
    icon.font="$FONT:Bold:13.0"
    icon.color=$GREY
    icon.padding_left=8
    icon.padding_right=8
    padding_left=2
    padding_right=2
    background.color=$BACKGROUND_2
    background.corner_radius=6
    background.height=24
    background.drawing=off
    label.drawing=off
    click_script="aerospace workspace $sid"
    script="$PLUGIN_DIR/aerospace.sh $sid"
  )

  sketchybar --add item space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid aerospace_workspace_change mouse.clicked
done

spaces_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces_bracket[@]}"
