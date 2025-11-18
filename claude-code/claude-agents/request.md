# Request

## Tasks

I want you to modify the claude-code agent given in the resources by following the `Change to be done`.

Output the improved agent file entirely as an artefact.

ONLY MODIFY what is related to my request ! Do not modify what I did not request for !

## Resources

You will be provided this resources

- `@.claude/CLAUDE.md` the project workflow for agent to operate
- The current agent to improve

## Change to be done

### Agentic Workflow

Ensure that the agent file reflect that it will be used in an agentic workflow with no human to read it's output. It should provide the expected result / files / output without human-verbose-oriented output. Once it's task accomplished, another agent in the workflow will be running and proceed the next steps on it's own.

Ensure that the agent follow this principle by adding constraint or rule to respect this request.

# Resources

Below are all the resources required for you to accomplish the request.

# CLAUDE.md

## Overall Instruction

This file describe the framework to work on this project and should never be modified.

Every project related data that you need to save, read or edit are located in others files that will be described here.

## Folder @docs

All the project documentation (functional, technical, and other).

Maintain the files in @docs folder to always reflect the current project's state.

Always read the entire folder content before executing any requests.

### File description in @docs

#### @docs/project_overview.md

It is a high-level project description.

#### @docs/requirements_functional.md

Functional requirements of the project.

#### @docs/requirements_technical.md

Technical requirements of the project.

### File description in @dev

#### @dev/tasks.md

All tasks and sub-tasks related to the projects ( planning, implementation, review, research, etc.. ).

Carefully maintain this file by doing the following, but not only:

- Remove tasks that had been canceled / aborted
- Tick ([x]) the tasks that had been implemented
- Add the missing tasks during implementation planing

Follow this structure:

```tasks.md example
# Tasks

## 1.0 Project Initialisation

- [x] 1.1 Initialise project folder
  - [x] 1.1.1 Initialise npm
  - [x] 1.1.2 ...

## 2.0 Create helper for XML parsing

- [ ] 2.1 Create file helpers/xmlParser.js
- [ ] 2.2 Import and use helper in main routine
```

#### @dev/request.md

This is the latest request submited to claude-code.

#### @dev/agents.md

This file provide specifics instructions for CLAUDE-CODE. In case it would conflicts with instructions from CLAUDE.md, this file is always higher priority and source of truth.

### File description in @dev/plans

Store the latest implementation plan to be used for implementing.

When starting a new iterations, a hook will first move old plans to @dev/plans/archives.

#### Plan file name convention

plan_YYMMDD_X.X_feature.md: prefix plan_, the date, the task number, a task identifier.
Example: plan_251114_1.2.2_xmlParser.md

#### @dev/plans/archives

All past plans. This folder is forbidden or you to read.
