# Workflow

UI file guide: ./app.configs/guide.files.md
Folders UI:
-  ./app.configs/aerospace
-  ./app.configs/borders
-  ./app.configs/sketchybar

## Review

Start one sub agent opus, tech lead, for each UI folders.

It review the code implementation in the folder.

- read file guide
- Clean Code
- Potential errors
- Performance optimization

It write the file `[folder].review.md`

## Make Plan

As soon as a `review` file is written

Assign it to a new sub agent opus tech lead.

- read file guide
- read review
- ensure the review is correct
- if any change needed for this file, write `[folder].plan.md`

This sequence run in parallel with the previous, as soon as one folder review is done, you run the new agent from this sequence with the file.

## Review Plans

Start a single sub agent opus tech lead.

- Read file guide
- Read all plan
- Verify if any change breaks something about the overall integretion of the 3 app.
- It generate one single plan `master.plan.md`, grouping all change together and ensure they are not breaking anything.

## Implement

Start a single sub agent opus tech lead.

- Read file guide
- Read `master.plan.md`
- Implement