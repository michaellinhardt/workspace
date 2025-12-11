---
description: Turn a brainstorm file into Module modification for a Course. Read -> Plan -> Apply -> Review
---

# Request

Obtain the file guide and use it.

Create a task for each steps.

## Folders & Context

- `./` = Module folder (edit only)
- `../` = Course folder
- `../../` = All Courses + templates

Brainstorm is unstructured draft containing:

- Ideas for Module(s)
- No file specification (must deduce)
- Purpose: Apply to `./content` files of the module

## Plan Structure

- 1 level-1 header max
- Max 3 headers total
- No decoration (bold, etc.) except instructions (e.g., `./content/`)

```markdown
# Change plan (brainstorm request)

## Request Summary
## `./[file to change]`
### 1. [change 1]
[plan to change this file]
```

## Files

1. Context:
   - `../C0 - 00 Project Context.md`
   - `../C0 - 00 Module List & Content summary.md`
2. Brainstorm:
   - `./request brainstorm.md`
   - `./plan brainstorm.md`
3. Templates:
   - `../../00 Template Module Files/`

## Task

1. Read context + brainstorm files
2. Map templates ↔ content files
3. List `./content` files impacted by `request brainstorm`
4. /compact
5. Task sub-agent: generate `./plan brainstorm.md`
   - Provide plan structure
   - Include context files if needed:
     - `../C0 - 00 Project Context.md`
     - `../C0 - 00 Module List & Content summary.md`
5. Per plan file: task sub-agent to apply changes
   - Input: context, brainstorm, content files list
   - Assigned: `./content/[file.md]` or context file
   - Guide: corresponding template from `00 Template Module Files`
6. All sub-agents complete
7. Per changed/created file: task review sub-agent
   - Input: context, brainstorm, content files list
   - Assigned: `./content/[file.md]`
   - Action: find/fix mistakes
8. Done
