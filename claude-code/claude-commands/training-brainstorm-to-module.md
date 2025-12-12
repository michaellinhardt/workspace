---
description: Turn a brainstorm file into Module modification for a Course. Read -> Plan -> Apply -> Review
---

# Request

Obtain and use the file guide from @agt-seq-file-guide agent.

## Files

./00 Template Module Files/*
./Course 0 - Foundations/*

brainstorm file: given in the request

## Constraints

- Don't read files unless instructed
- Only sub-agents read/edit files

## Workflow

Run: `rm -rf ./agts && mkdir ./agts`

Execute level-2 headers as sequential tasks.

## Brainstorm Mapping

Sub-agent: Read brainstorm → Generate `./agts/braintorm.mapping.agt.md` listing all impacted files (module, course folders, etc.).

Structure:
```
# Brainstorm File Mapping

- `./content/C0 - M1 - Script.md`
[explain changes needed + rationale]

- `./next file/..`
[...]
```

## Compress brainstorm mapping

Sub-agent prompt compressor: Compress `./agts/braintorm.mapping.agt.md`

## Compact 1

Execute /compact to compact your context

## List Impacted Files

Sub-agent: Read `./agts/braintorm.mapping.agt.md` → Return only impacted file list.

Example output:
```
- `./content/C0 - M1 - Script.md`
- `./content/C0 - M1 - Slide Deck.md`
```

## Generate Plans

For each listed file, start sub-agent (async).

Each sub-agent:
- Assigned one impacted file
- Reads brainstorm file + brainstorm mapping
- Generates `./agts/[file name].plan.agt.md`

## Compact 2

Execute /compact to compact your context

## Apply Changes

For each listed file, start sub-agent (async).

Each sub-agent:
- Assigned one impacted file
- Reads brainstorm file + plan file for assigned file
- Applies changes to assigned file
