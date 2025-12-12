---
description: Turn a brainstorm file into Module modification for a Course.
---

# Instructions

## Files & folder

`./Course 0 - Foundations/C0 - 00 Project Context.md`
`./Course 0 - Foundations/C0 - 00 Module List & Content summary.md`
`./Course 0 - Foundations/Module 0 - Foundations/content/*`
`./Course 0 - Foundations/Module 1 - Prompting/content/*`

Brainstorm File: `./request brainstorm.md`

## Constraints

- Don't read files unless instructed
- Only sub-agents read/edit files

Now, Execute the workflow.

# Workflow

Create one task per level-2 header.

Run level-2 header sequentially.

## Setup agt folder

Run: `rm -rf ./agts && mkdir ./agts`

## Build File-Guide

Use sub-agent `agt-seq-file-guide`, in it's prompt you provide the path of the initial request file(s) you received. The agent will build the file-guide `./files.agt.md` based on this request specifically. Read this file.

## Generate Plans

Use sub-agent `agt-training-teacher-documentor`: Read brainstorm + Context → Generate `./agts/braintorm.plan.agt.md`. A file is impacted by the brainstorm when the changes it instruct will edit the content of this file. The plan, for each file impacted, describe in details all the changes needed. This plan should respect the overall coherence, integrity and harmony of the module. It not only give what to change but how to implement it, what is important (ton, transition with previous sequence, conciseness, importance, etc..)

## Apply Changes

Read `./agts/braintorm.plan.agt.md`

For each listed file, start sub-agent `agt-training-teacher-documentor` (async).

Each sub-agent:
- Assigned one impacted file
- Reads brainstorm file + plan file for assigned file
- Applies changes to assigned file
