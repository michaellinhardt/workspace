#!/bin/bash

# Script to create symlinks from a code project into the current folder (Obsidian vault)
# Usage: sopai-obsidian-link ~/dev/my-code-project

if [ -z "$1" ]; then
    echo "Error: No path provided"
    echo "Usage: sopai-obsidian-link <path-to-code-project>"
    exit 1
fi

SOURCE_PATH="$1"

# Expand tilde if present
SOURCE_PATH="${SOURCE_PATH/#\~/$HOME}"

# Check if source folder exists
if [ ! -d "$SOURCE_PATH" ]; then
    echo "Error: Folder '$SOURCE_PATH' does not exist"
    exit 1
fi

CURRENT_DIR=$(pwd)

# Create symlinks
echo "Creating symlinks from '$SOURCE_PATH' into '$CURRENT_DIR'..."

# Link .claude -> claude
if [ -d "$SOURCE_PATH/.claude" ]; then
    ln -sfn "$SOURCE_PATH/.claude" "$CURRENT_DIR/claude"
    echo " Linked .claude -> claude"
else
    echo "  Skipped: $SOURCE_PATH/.claude does not exist"
fi

# Link dev -> dev
if [ -d "$SOURCE_PATH/dev" ]; then
    ln -sfn "$SOURCE_PATH/dev" "$CURRENT_DIR/dev"
    echo " Linked dev -> dev"
else
    echo "  Skipped: $SOURCE_PATH/dev does not exist"
fi

# Link docs -> docs
if [ -d "$SOURCE_PATH/docs" ]; then
    ln -sfn "$SOURCE_PATH/docs" "$CURRENT_DIR/docs"
    echo " Linked docs -> docs"
else
    echo "  Skipped: $SOURCE_PATH/docs does not exist"
fi

echo "Done!"
