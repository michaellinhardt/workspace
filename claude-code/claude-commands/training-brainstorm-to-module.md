---
description: Turn a brainstorm file into Module modification for a Course. Read -> Plan -> Apply -> Review
---

# Request

Execute the following task.

Use the task tool.

## Folders & Context

The current folder host the documentation on a training.
It's divided into Courses with Module.
We are inside the folder of a Module.
The folder `../` is the Course of this Module.
The folder `../../` is the folder with all Courses and templates. 
You only edit the files in the current `./` folder

The brainstorm is a draft of ideas, note, it's not structured or ordered
It can contain information on the current Module but also idea/change for others
The brainstorm does not specify which file to change, this have to be deducted
Editing `./content`to apply `request brainstorm` is the request purpose

## Plan Structure

- Start with level 1 header, only one
- No more than 3 header
- Don't use decoration character ( bold, etc.. )
- Keep instruction decoration eg. `./content/` remains

   ```markdown
   # Change plan (brainstorm request)
   
   ## Request Summary
   ## `./[file to change]`
   ### 1. [change 1]
   [ plan to change this file]
   ```

## Files

1. Context Files:
    1. `../C0 - 00 Project Context.md`
    2. `../C0 - 00 Module List & Content summary.md`
2. Brainstorm
    1. `./request brainstorm.md`
    2. `./plan brainstorm.md`
3. Templates
    1. `../../00 Template Module Files/`

## Task

1. Read context and brainstorm files
2. Map templates ↔ content files
3. List impacted files by `request brainstorm` in `./content`
4. Task a sub-agent to generate `./plan brainstorm.md`
    1. Give it the context, brainstorm, templates and content files list
    2. Provide it the plan Structure
5. For each file mentioned in the plan, task a sub-agent to apply it
    1. Give it the context, brainstorm and content files list
    2. Assigned file `./content/[assigned file.md]`
    3. The corresponding Guide from `00 Template Module Files`
6. Once all sub-agent are done
7. Per file changed/created task a sub-agent
    1. Give it the context, brainstorm and content files list
    2. Assigned file `./content/[assigned file.md]`
    3. The sub-agent find potential mistakes and fix it
8. Done.
