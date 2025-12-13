# CLAUDE.md

**Role:** Orchestrator agent executing persona/agent workflows.

**Core Directives:**
- Run multi-agent workflows
- Optimize context window: avoid unnecessary file reads
- Read files partially when only classifying
- Create tasks for all operations
- Provide concise workflow state & events log after each task

**Folder Structure:**

`./archived` - Outdated prompts/reports (ignore)

## Agent Files

**Workflow Folder Creation:**
If `./agts` exists, create: `mkdir "./agts/wkf.$(date +%s)/"`

**Usage:** You and sub-agents save non-project files (memory, workflow state, reports, plans) in this folder. Provide exact path to all agents.

Even when not explicitly instructed, if a file match with the purpose of `agts` folder ensure it is used from this folder, using the conventions.

## workflow.context.md

Create `./agts/wkf.xxx/workflow.context.md`

A structured report file of the initial request, what will do this workflow, how, why, etc.. any information you have so far, well structured. What is the acceptance criteria to validate the workflow.

When you finish, write a report on the execution. List of tasks accomplished with very short concise summary of the task. List of AGT file related, what they used for. Project file created/edited, concise reason for each. Any relevant informations.

### Naming Convention

**Location:** `./agts/wkf.xxx/`

**Rules:**
- Extension: `.[type]` before file extension (e.g., `sota.persona.context.md`)
- Format: no spaces, no special chars, use dots as separators
- Style: concise and explicit

**Examples:**
- `task.3.3.plan.context.md`
- `research.plan.context.md`
- `references.log.md`

**Using file [type]:**
When instructed to give all `context` files, it imply path of files in `./agts/wkf.xxx/` finishing by `.context.md`

**Note:** Instruct sub-agents on this convention.

## Workflow Syntax

Create a task for lvl 2 headers
Create a task for lvl 3 headers, start with `sub: `

Headers are sequence to execute one by one by default.

## Sequences Files

A sequence file is a part of the workflow saved into one file.

Often separated to be executed based on decision taken inside the workflow.

From the initial request file

```example
- If user select option 1, execute now project.overview.seq.md
```

This instruction request you to read `./seqs/doc.changes.seq.md` and to execute it as part of the workflow. Either execute now or instructed at a specific time/event.

You run the sequence yourself and it may instructs you to run sub-agents, etc.. The sequence is similar to your request structure with level 2 and 3 headers.

Once done you continue where you left in the main workflow.

After each sequence, you output a summary of task done and remaining.

Then you compact your context window, refocus the context into the main workflow (use tool or whatever method to do it).

## When to use Sequence

The following trigger request you to immediately read and execute the sequence file.

- Edit content in `./docs`: `./seqs/doc.changes.seq.md`

