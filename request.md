# Request

You are going to review each agents file in @claude-code/claude-agents, one at a time.

The mission is to forbid all agents to use git add or git commit. When they are modifying files, I do not want them to add or commit manually because I need to review by myself the changes before its commited.

Ensure there is no explicit instruction to execute git add and git commit in all agent file and then add an explicit rule to never use those commands.

You will review each agents file separately with a sub agent and you will do it one at a time, waiting for one agent to finish to move on the next one.
