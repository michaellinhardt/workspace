#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"

# Get memory usage using vm_stat
PAGESIZE=$(pagesize)
VM_STAT=$(vm_stat)

# Parse vm_stat output
PAGES_FREE=$(echo "$VM_STAT" | grep "Pages free" | awk '{print $3}' | tr -d '.')
PAGES_ACTIVE=$(echo "$VM_STAT" | grep "Pages active" | awk '{print $3}' | tr -d '.')
PAGES_INACTIVE=$(echo "$VM_STAT" | grep "Pages inactive" | awk '{print $3}' | tr -d '.')
PAGES_SPECULATIVE=$(echo "$VM_STAT" | grep "Pages speculative" | awk '{print $3}' | tr -d '.')
PAGES_WIRED=$(echo "$VM_STAT" | grep "Pages wired down" | awk '{print $4}' | tr -d '.')
PAGES_COMPRESSED=$(echo "$VM_STAT" | grep "Pages occupied by compressor" | awk '{print $5}' | tr -d '.')

# Calculate used and total memory
USED=$((PAGES_ACTIVE + PAGES_WIRED + PAGES_COMPRESSED))
TOTAL=$((USED + PAGES_FREE + PAGES_INACTIVE + PAGES_SPECULATIVE))

# Calculate percentage and set color
if [ "$TOTAL" -gt 0 ]; then
  PERCENT=$((USED * 100 / TOTAL))

  # Color by range: green -> yellow -> orange -> red
  if [ "$PERCENT" -lt 20 ]; then
    COLOR=$GREEN
  elif [ "$PERCENT" -lt 40 ]; then
    COLOR=$GREEN
  elif [ "$PERCENT" -lt 60 ]; then
    COLOR=$YELLOW
  elif [ "$PERCENT" -lt 80 ]; then
    COLOR=$ORANGE
  else
    COLOR=$RED
  fi

  sketchybar --set $NAME label="${PERCENT}%" icon.color=$COLOR
else
  sketchybar --set $NAME label="0%" icon.color=$GREEN
fi
