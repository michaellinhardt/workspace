---
description: Runs the iterative implementation and review workflow (Plan -> Implement -> Review -> Loop)
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
4. **agt-review-1-fidelity**: Check fidelity to documentation.
5. **agt-review-2-bugs**: Check for logic errors.
6. **agt-review-4-cleancode**: Check for style and cleanliness.
7. **agt-review-5-security**: Check for security vulnerabilities.
8. Run sh script ~/workspace/claude-code/scripts/sopai-clean-all.sh
9. Repeat from step 1 until there is no tasks to implements.

## Conditional Logic (The Fix Loop)

During steps 4, 5, 6, or 7 (the review agents):

- If a review agent reports issues and generates a new plan/fix list:
  - **PAUSE** the sequence.
  - **RUN** `agt-code-implementation` immediately to apply those fixes.
  - **RESUME** the sequence from the next review agent.
