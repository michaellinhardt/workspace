#!/bin/bash

# 1. Ensure BetterDisplay is running
# open -a BetterDisplay

# 2. Create the screen if it doesn't exist (idempotent check is complex in bash, 
# so we just ensure a screen with the right specs exists or rely on auto-connect)
# Note: BetterDisplay usually remembers the last layout. 
# If you need to force a fresh screen:
# betterdisplaycli set -namelike="iPadVertical" -connected=off
betterdisplaycli set -namelike="iPadVertical" -connected=on


# 3. (Optional) Force high resolution (HiDPI) for crisp text
# Adjust resolution to match your specific iPad model (e.g., 1668x2224 for 12.9")
betterdisplaycli set -namelike="iPadVertical" -resolution=1024x768