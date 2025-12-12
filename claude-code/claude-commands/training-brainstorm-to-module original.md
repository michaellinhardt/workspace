---
description: Turn a brainstorm file into Module modification for a Course. Read -> Plan -> Apply -> Review
---

# Request

Obtain and use the file guide.

## Files

./00 Template Module Files/*
./Course 0 - Foundations/*

## Constraints

- Don't read files unless instructed
- Only sub-agents read/edit files

## Workflow

run `rm -rf ./agts && mkdir ./agts` now

Execute level-2 headers as sequential tasks.

## Brainstorm Mapping

Task a sub-agent to read the brainstorm and generate a file `./agts/braintorm.mapping.agt.md` where it list all files impacted by the brainstorm. Files impacted in module folder, course folder, etc..

The sub-agent structure the file as follow:

```example
# Brainstorm File Mapping

- `./content/C0 - M1 - Script.md`
[ explain what needs to be change and why ]

- `./next file/..`
  [...]
```

## Compress brainstorm mapping

Run a sub-agent prompt compressor to compress `./agts/braintorm.mapping.agt.md`

## Compact 1

Execute /compact

## List Impacted Files

Run a sub-agent, ask it to read `./agts/braintorm.mapping.agt.md` and return to you the list of impacted file, nothing else. Example:

```output
- `./content/C0 - M1 - Script.md`
- `./content/C0 - M1 - Slide Deck.md`
```

## Generate Plans

For each file listed, start a sub-agent (all asynchronous).

Assign each sub-agent with one impacted file.

Ask it to read the brainstorm file and the brainstorm mapping.

Then generate the file `./agts/[file name].plan.agt.md`

## Compact 2

Execute /compact

## Apply Changes

For each file listed, start a sub-agent (all asynchronous).

Assign each sub-agent with one impacted file.

Ask it to read the brainstorm file and the plan file for its assigned file.

Then apply the change to the assigned file.
