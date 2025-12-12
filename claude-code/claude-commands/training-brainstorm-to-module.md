---
description: Turn a brainstorm file into Module modification for a Course. Read -> Plan -> Apply -> Review
---

# Instructions

First ! Use sub-agent `@agt-seq-file-guide`, in it's prompt you provide the path of the initial request file(s) you received. The agent will build the file-guide based on this request specifically and give it to you via it's prompt output.

## Context

The workflow below guide you to gather context, read the brainstorm (a list of changes to apply), generate plans and implement the change in the module content.

## Files & folder

`./Course 0 - Foundations/C0 - 00 Project Context.md`
`./Course 0 - Foundations/C0 - 00 Module List & Content summary.md`
`./Course 0 - Foundations/Module 0 - Foundations/content/*`
`./Course 0 - Foundations/Module 1 - Prompting/content/*`

Brainstorm File: given in the request

## Constraints

- Don't read files unless instructed
- Only sub-agents read/edit files

Now, Execute the workflow.

# Workflow

Run: `rm -rf ./agts && mkdir ./agts`

Execute level-2 headers as sequential tasks.

## Brainstorm Mapping

Sub-agent `@agt-training-teacher-documentor`: Read brainstorm + Context → Generate `./agts/braintorm.mapping.agt.md` listing all impacted files. A file is impacted when the brainstorm is a change that request to edit the content of this file.

Structure:
```
# Brainstorm File Mapping

- `./content/C0 - M1 - Script.md`
[explain changes needed + rationale]

- `./next file/..`
[...]
```

Emphasis the sub-agent instruction: `Do not not apply the changes, only write the plan !`

## Generate Plans

Sub-agent `@agt-training-teacher-documentor`: Read brainstorm + Context → Generate `./agts/braintorm.plan.agt.md`. A file is impacted by the brainstorm when the changes it instruct will edit the content of this file. The plan, for each file impacted, describe in details all the changes needed. This plan should respect the overall coherence, integrity and harmony of the module.

## Apply Changes

Read `./agts/braintorm.plan.agt.md`

For each listed file, start sub-agent `@agt-training-teacher-documentor` (async).

Each sub-agent:
- Assigned one impacted file
- Reads brainstorm file + plan file for assigned file
- Applies changes to assigned file
