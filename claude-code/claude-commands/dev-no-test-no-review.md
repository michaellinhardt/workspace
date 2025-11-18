---
description: Runs the iterative implementation (Plan -> Implement -> Review -> Loop)
---

# Workflow Orchestration

You are the Orchestrator. Your goal is to execute the following sequence of sub-agents.

**Rules:**

1. You must run these agents sequentially.
2. You must wait for one subagent to finish completely before running the next.
3. Do not attempt to write code or plans yourself; delegate strictly to the agents listed below.

## Execution Order

1. **agt-code-plan**: Generate the initial plan.
2. **agt-code-plan-review**: Review the generated plan.
3. **agt-code-implementation**: Implement the code based on the approved plan.
