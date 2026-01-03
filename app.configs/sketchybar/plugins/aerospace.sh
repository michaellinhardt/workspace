#!/bin/bash

# CriticalElement style workspace indicator with multi-monitor support
# - Highlights active workspace on EACH monitor with distinct colors
# - Shows app names next to workspace number
# - Main monitor (focused): PINK
# - Secondary monitor (visible): GREEN
# - Third monitor (visible): ORANGE

source "$HOME/.config/sketchybar/colors.sh"

WORKSPACE_ID="$1"

# Function to shorten common app names
shorten_app_name() {
    local app="$1"
    case "$app" in
        "Google Chrome") echo "Chrome" ;;
        "Visual Studio Code") echo "Code" ;;
        "Microsoft Edge") echo "Edge" ;;
        "Microsoft Word") echo "Word" ;;
        "Microsoft Excel") echo "Excel" ;;
        "Microsoft PowerPoint") echo "PPT" ;;
        "Microsoft Outlook") echo "Outlook" ;;
        "System Preferences") echo "Prefs" ;;
        "System Settings") echo "Settings" ;;
        "Activity Monitor") echo "Activity" ;;
        "Sublime Text") echo "Sublime" ;;
        "IntelliJ IDEA") echo "IDEA" ;;
        "Android Studio") echo "Android" ;;
        "Docker Desktop") echo "Docker" ;;
        "Brave Browser") echo "Brave" ;;
        *) echo "$app" ;;
    esac
}

# Get all visible workspaces across all monitors
VISIBLE_WORKSPACES=$(aerospace list-workspaces --monitor all --visible 2>/dev/null)

# Get the focused workspace (main monitor)
FOCUSED_WS=$(aerospace list-workspaces --focused 2>/dev/null)

# Determine if this workspace is visible and on which monitor
IS_VISIBLE=false
IS_FOCUSED=false
MONITOR_INDEX=0

if [ "$WORKSPACE_ID" = "$FOCUSED_WS" ]; then
    IS_FOCUSED=true
    IS_VISIBLE=true
fi

# Check if workspace is visible on any monitor
MONITOR_COUNT=0
for ws in $VISIBLE_WORKSPACES; do
    MONITOR_COUNT=$((MONITOR_COUNT + 1))
    if [ "$ws" = "$WORKSPACE_ID" ]; then
        IS_VISIBLE=true
        if [ "$ws" != "$FOCUSED_WS" ]; then
            MONITOR_INDEX=$MONITOR_COUNT
        fi
    fi
done

# Get apps in this workspace
APPS=""
APP_LIST=$(aerospace list-windows --workspace "$WORKSPACE_ID" --format '%{app-name}' 2>/dev/null)

if [ -n "$APP_LIST" ]; then
    while IFS= read -r app; do
        if [ -n "$app" ]; then
            SHORT_NAME=$(shorten_app_name "$app")
            if [ -z "$APPS" ]; then
                APPS="$SHORT_NAME"
            else
                APPS="$APPS $SHORT_NAME"
            fi
        fi
    done <<< "$APP_LIST"
fi

# Determine highlight color based on monitor
if [ "$IS_FOCUSED" = true ]; then
    # Main monitor (focused) - PINK
    BG_COLOR=$PINK
elif [ "$IS_VISIBLE" = true ]; then
    # Secondary/tertiary monitors
    if [ "$MONITOR_INDEX" -eq 2 ]; then
        # Second monitor - GREEN
        BG_COLOR=$GREEN
    elif [ "$MONITOR_INDEX" -ge 3 ]; then
        # Third+ monitor - ORANGE
        BG_COLOR=$ORANGE
    else
        # Fallback for first non-focused visible (shouldn't happen often)
        BG_COLOR=$GREEN
    fi
else
    # Not visible - transparent
    BG_COLOR=$TRANSPARENT
fi

# Update the workspace item
sketchybar --set space.$WORKSPACE_ID \
    background.color=$BG_COLOR \
    label="$APPS"
