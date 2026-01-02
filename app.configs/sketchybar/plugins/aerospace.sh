#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

FOCUSED="$FOCUSED_WORKSPACE"
WORKSPACE_ID="$1"

# Get all visible workspaces (one per monitor)
VISIBLE_WORKSPACES=$(aerospace list-workspaces --monitor all --visible 2>/dev/null)

# Check if this workspace is visible on any monitor
IS_VISIBLE=false
while IFS= read -r ws; do
    if [ "$ws" = "$WORKSPACE_ID" ]; then
        IS_VISIBLE=true
        break
    fi
done <<< "$VISIBLE_WORKSPACES"

if [ "$WORKSPACE_ID" = "$FOCUSED" ]; then
    # Focused workspace (current monitor) - Blue
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=$BLUE \
        icon.color=$BLACK
elif [ "$IS_VISIBLE" = true ]; then
    # Visible on another monitor - Green
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=$GREEN \
        icon.color=$BLACK
else
    # Not visible - check if has windows
    WINDOW_COUNT=$(aerospace list-windows --workspace "$WORKSPACE_ID" 2>/dev/null | wc -l)
    if [ "$WINDOW_COUNT" -gt 0 ]; then
        # Has windows but not visible - White text
        sketchybar --set $NAME \
            background.drawing=off \
            icon.color=$WHITE
    else
        # Empty workspace - Grey text
        sketchybar --set $NAME \
            background.drawing=off \
            icon.color=$GREY
    fi
fi
