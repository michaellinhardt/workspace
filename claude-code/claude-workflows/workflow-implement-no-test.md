# Request

You will execute the following workflow. Each step you will run a sub-agents and wait for it to be done before moving to next step.

The purpose of this workflow is to pilot each agent in a specific order to implement iteratively the tasks listed in the project in accordance to the documentation.

You should wait for one subagent to finish before running the next one !

## Workflow

1) agt-code-plan
2) agt-code-plan-review
3) agt-code-implementation
4) agt-review-1-fidelity
5) agt-review-2-bugs
6) agt-review-4-cleancode
7) agt-review-5-security

## agt-review-*

When one of this review agent run ( agt-review-* ) and generate a new plan to fix something, the workflow should run the agent agt-code-implementation to execute this plan before moving to the next step.
