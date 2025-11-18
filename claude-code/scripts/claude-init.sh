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

copy_template_if_missing "$CLAUDE_TEMPLATES/claude/settings.local.json" ".claude/settings.local.json"

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
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/requirements_functional.md" "docs/requirements_functional.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/docs/requirements_technical.md" "docs/requirements_technical.md"

########################################
# Initialize dev directory and template files
########################################

# Create dev directory if it doesn't exist
if [ ! -d "dev" ]; then
  mkdir dev
  echo "Initialized dev directory."
fi

# Create dev directory if it doesn't exist
if [ ! -d "./dev/archived-requests" ]; then
  mkdir ./dev/archived-requests
  echo "Initialized dev/archived-requests directory."
fi

# Copy template files
copy_template_if_missing "$CLAUDE_TEMPLATES/dev/agents.md" "dev/agents.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/dev/request.md" "dev/request.md"
copy_template_if_missing "$CLAUDE_TEMPLATES/dev/tasks.md" "dev/tasks.md"

########################################
# Initialize plans directory and template files
########################################

if [ ! -d "dev/plans" ]; then
  mkdir ./dev/plans
  echo "Initialized dev/plans directory."
fi

if [ ! -d "dev/plans/archived" ]; then
  mkdir ./dev/plans/archived
  echo "Initialized dev/plans/archived directory."
fi

########################################
# Agents
########################################

# List all files in claude-agents and create symbolic links in .claude/agents
if [ ! -d ".claude/agents" ]; then
  mkdir -p .claude/agents
fi

for agent_file in "$CLAUDE_AGENTS"/*; do
  if [ -f "$agent_file" ]; then
    agent_filename=$(basename "$agent_file")
    if [ ! -f ".claude/agents/$agent_filename" ]; then
      ln -s "$agent_file" ".claude/agents/$agent_filename"
      echo "Created symbolic link for agent: $agent_filename"
    fi
  fi
done

########################################
# Workflows
########################################

# List all files in claude-workflows and create symbolic links in .claude/workflows
if [ ! -d ".claude/workflows" ]; then
  mkdir -p .claude/workflows
fi

for workflow_file in "$CLAUDE_WORKFLOWS"/*; do
  if [ -f "$workflow_file" ]; then
    workflow_filename=$(basename "$workflow_file")
    if [ ! -f ".claude/workflows/$workflow_filename" ]; then
      ln -s "$workflow_file" ".claude/workflows/$workflow_filename"
      echo "Created symbolic link for workflow: $workflow_filename"
    fi
  fi
done

########################################
# DONE!
########################################

echo "done"