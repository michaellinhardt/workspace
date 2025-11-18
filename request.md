# Request

## Change 1

I need you to modify the @claude-code/claude-agents/agt-code-plan.

Currently when it generate the implementation plan, it appears to do more tasks than it should.

The rule I want to enphasis is to never to more than one high-level task and its subtask.

What is a high-level task ?

Given the following list of tasks:

```task-example
## 3.0 Storage System Implementation
<!-- Estimated: 16 hours total | Depends on: 2.1 -->
- [x] 3.1 Storage service core [CRITICAL PATH] (implements FR-3)
  - [x] 3.1.1 Create StorageService class structure
  - [x] 3.1.2 Implement initialization operations (TR-19)
  - [x] 3.1.3 Ensure ~/.transcriptor directory structure
  - [x] 3.1.4 Initialize empty data.json if missing
- [ ] 3.2 Registry operations (implements FR-3.2, TR-16)
  - [ ] 3.2.1 Implement registry loading from data.json
  - [ ] 3.2.2 Create registry update methods
  - [ ] 3.2.3 Implement atomic write operations (TR-8)
  - [ ] 3.2.4 Add registry validation logic
- [ ] 3.3 File operations (implements TR-17)
  - [ ] 3.3.1 Implement transcript save functionality
  - [ ] 3.3.2 Create transcript read methods
  - [ ] 3.3.3 Add file existence checking
  - [ ] 3.3.4 Implement file deletion with error handling
```

On the example above, a high-level task is 3.2 and all the 3.2.X ! Nothing more.

The task 3 should never be implemented entirely in one iteration, it should only be 3.X and all it's subtask, except if there is no task labeled 3.X, example if 3.0 does not have any 3.1, 3.2, etc.. it can implement only 3.0, otherwise it will do 3.1 and its subtask ( 3.1.X ) but not 3.2 !

Enphasis this as a rule to ensure it always respect this approach.

## Change 2

When generating a plan, it should always add a "Summary of Plan" at the top of the file, explaining in a verbose way what we are planning to implement. It have to remain concise.

## Change 3

When generating a plan, after the Summary, it should list explicitely the task that are targeted by this plan. If we take the tasks example above, the plan will include something like

```example
## Tasks Planned
- 3.2 Registry operations (implements FR-3.2, TR-16)
  - 3.2.1 Implement registry loading from data.json
  - 3.2.2 Create registry update methods
  - 3.2.3 Implement atomic write operations (TR-8)
  - 3.2.4 Add registry validation logic
```
