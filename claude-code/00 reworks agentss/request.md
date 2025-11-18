# Request

## Tasks

I want you to modify the claude-code agent in this folder by following the `Change to be done`. You will start a subagent for each agent file in the folder and apply this request to the file.

Changes should respect the markdown structure and header hierarchy, it can only have one top level header ! 

Output the improved agent file entirely as an artefact.

ONLY MODIFY what is related to my request ! Do not modify what I did not request for !

## Resources

You will be provided this resources

- `@.claude/CLAUDE.md` the project workflow for agent to operate
- The current agent to improve

## Change to be done

### Agentic Workflow

Ensure that the agent file reflect that it will be used in an agentic workflow with no human to read it's output. It should provide the expected result / files / output without human-verbose-oriented output. Once it's task accomplished, another agent in the workflow will be running and proceed the next steps on it's own.

Read carefully the agent file, identify parts that are designed to produce human-oriented output and removes them. Then add a strict rule or constraint to ensure the agent follow this agentic principle. Ensure also that it does not already exist in the file, be mindful.

![[../claude-links/CLAUDE]]