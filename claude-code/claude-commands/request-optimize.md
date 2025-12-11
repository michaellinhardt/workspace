# Request

Do not read files until instructed.

Save copy: `./[filename] original.md`

Prompt user:

```
Agent for `./file_path`?
[Numbered list of compatible agents]
Example:
1. agt-seq-file-guide
2. [...]
or all.
```

User confirms agent → start sequential execution.

**Execution Priority:**

1. agt-seq-workflow-compactor
2. agt-seq-prompt-compressor
3. [other agents]
4. agt-seq-file-guide (always last)

**Loop:**
(Skip `agt-seq-file-guide` during loop)

- Run sub-agent (by priority)
- Provide request file path
- Wait for completion
- Run next agent

Execute `/compact`

If selected: give request file to `agt-seq-file-guide` → receive file guide.

Finally: read and execute file instructions using file guide if provided.
