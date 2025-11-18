#!/bin/bash

########################################
# Agents
########################################

# create the folder $CLAUDE_GLOBAL_AGENTS as a link to $CLAUDE_WORKSPACE_AGENTS
if [ ! -d "$CLAUDE_GLOBAL_AGENTS" ]; then
  ln -s "$CLAUDE_WORKSPACE_AGENTS" "$CLAUDE_GLOBAL_AGENTS"
fi

########################################
# Commands
########################################

# create the folder $CLAUDE_GLOBAL_COMMANDS as a link to $CLAUDE_WORKSPACE_COMMANDS
if [ ! -d "$CLAUDE_GLOBAL_COMMANDS" ]; then
  ln -s "$CLAUDE_WORKSPACE_COMMANDS" "$CLAUDE_GLOBAL_COMMANDS"
fi

########################################
# DONE!
########################################

echo "done"