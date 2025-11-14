#!/bin/bash

echo "Initializing Claude..."

########################################
# Initialize .claude and CLAUDE.md link
########################################

# Create .claude directory if it doesn't exist
if [ ! -d ".claude" ]; then
  mkdir .claude
  echo "Initialized .claude directory."
fi

# if ./claude/CLAUDE.md does not exist, create a link from $CLAUDE_LINKS/CLAUDE.md to ./claude/CLAUDE.md
if [ ! -f "./claude/CLAUDE.md" ]; then
  ln -s $CLAUDE_LINKS/CLAUDE.md ./.claude/CLAUDE.md
  echo "Created symbolic link for CLAUDE.md."
fi

########################################
# Initialize docs directory and template files
########################################

# Create docs directory if it doesn't exist
if [ ! -d "docs" ]; then
  mkdir docs
  echo "Initialized docs directory."
fi

# Function to copy template file if it doesn't exist
copy_template_if_missing() {
  local filename=$1
  local filepath="docs/$filename"
  
  if [ ! -f "$filepath" ]; then
    cp "$CLAUDE_TEMPLATES/docs/$filename" "./$filepath"
    echo "Created $filename in docs."
  fi
}

# Copy template files
copy_template_if_missing "project_overview.md"
copy_template_if_missing "tasks.md"
copy_template_if_missing "requirements_functional.md"
copy_template_if_missing "requirements_technical.md"
copy_template_if_missing "implementation_plan.md"

echo "done"