# Request

You will execute the following workflow loop by running sub-agents one after the other as described below.

The purpose of this workflow is to pilot each agent in a specific order to implement iteratively the tasks listed in the project in accordance to the documentation.

You should wait for one subagent to finish before running the next one !

## Workflow

1) agt-code-plan
2) agt-code-plan-review
3) agt-code-implementation
4) agt-review-1-fidelity
5) agt-code-implementation ( if previous agent generated a plan )

### 1. @agt-code-plan

to generate the plan for the next task and it's subtask.

### 2. @agt-code-plan-review

to double check on the generated plan.

### 3. @agt-code-implementation

to implement the plan generated in @dev/plans

### 4. @agt-review-1-fidelity

to review fidelity of the implementation

#### 4.1 @agt-code-implementation

IF @agt-review-1-fidelity generated a plan to fix something it will be implemented.
Properly provide the according plan to the agent.

### 5. @agt-review-2-bugs

to identify review bugs of the implementation

#### 5.1 @agt-code-implementation

IF @agt-review-2-bugs generated a plan to fix something it will be implemented.
Properly provide the according plan to the agent.

### 6. @agt-review-4-cleancode

to improve clean code syntax

#### 6.1 @agt-code-implementation

IF @agt-review-4-cleancode a plan to fix something it will be implemented.
Properly provide the according plan to the agent.

### 7. @agt-review-5-security

to improve security

#### 7.1 @agt-code-implementation

IF @agt-review-5-security a plan to fix something it will be implemented.
Properly provide the according plan to the agent.
