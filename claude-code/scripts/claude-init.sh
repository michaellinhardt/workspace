#!/bin/bash

########################################
# Functions
########################################

# Function to copy template file if it doesn't exist
copy_template_if_missing() {
  if [ ! -f "./$2" ]; then
    cp "$1" "./$2"
    echo "Created ./$2"
  fi
}

echo "Initializing Claude..."

########################################
# Initialize .claude
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

if [ ! -f "./claude/settings.json" ]; then
  ln -s $CLAUDE_LINKS/settings.json ./.claude/settings.json
  echo "Created symbolic link for settings.json."
fi

copy_template_if_missing "$CLAUDE_TEMPLATES/settings.local.json" ".claude/settings.local.json"
copy_template_if_missing "$CLAUDE_TEMPLATES/CLAUDE.local.md" ".claude/CLAUDE.local.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/request.md" ".claude/request.md"

########################################
# Initialize docs directory and template files
########################################

# Create docs directory if it doesn't exist
if [ ! -d "docs" ]; then
  mkdir docs
  echo "Initialized docs directory."
fi

# Copy template files
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/project_overview.md" "docs/project_overview.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/tasks.md" "docs/tasks.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/requirements_functional.md" "docs/requirements_functional.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/requirements_technical.md" "docs/requirements_technical.md"

########################################
# Initialize plans directory and template files
########################################

if [ ! -d "plans" ]; then
  mkdir plans
  echo "Initialized plans directory."
fi

if [ ! -d "plans/archived" ]; then
  mkdir ./plans/archived
  echo "Initialized plans/archived directory."
fi

########################################
# Agents
########################################

# List all files in claude-agents and create symbolic links in .claude/agents
if [ ! -d ".claude/agents" ]; then
  mkdir -p .claude/agents
fi

for agent_file in claude-agents/*; do
  agent_filename=$(basename "$agent_file")
  if [ ! -f ".claude/agents/$agent_filename" ]; then
	ln -s "$(realpath "$agent_file")" ".claude/agents/$agent_filename"
	echo "Created symbolic link for agent: $agent_filename"
  fi
done

echo "done"