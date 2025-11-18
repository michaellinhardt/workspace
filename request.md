# Request

I need you to modify the agents related to code review: @claude-code/claude-agents/agt-review-*

First, ensure those agents only generate a plan to fix the issue they found, no other files such as a report.

In this new generated plan, it should always include the following information at the top of the file:

```example
## Summary of Plan

[Verbose but concise explanation of what this plan implements. Describe the feature/functionality being built, the approach being taken, and why this matters for the project. This should give clear context about what's being accomplished in this iteration.]

## Tasks Planned

[Explicitly list the tasks targeted by this plan with full hierarchy]

- X.X [High-level task name] (implements FR-X, TR-X)
  - X.X.1 [Subtask name]
  - X.X.2 [Subtask name]
  - X.X.3 [Subtask name]
  - ...

## Plan Overview

[Concise paragraph: strategy, key decisions, expected outcome]
```

Review each of thise agent starting by "agt-review-" to be sure this is explicitly explained in the file.
