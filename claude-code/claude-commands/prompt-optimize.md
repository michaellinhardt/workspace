# Request

Do not read any file now, wait to be instructed to do it.

Save a copy of the given file in the request at `./[filename] original.md`

Prompt the user with the following

```prompt
What agent to use on `./file_path` ?
[ numerique list of all agent that can work on prompt/workflow ]
(example:
1. agt-seq-file-guide
2. [...]
or all.
```

Once the user confirm which agent to use, start a sequential execution on the file.

Below a list of execution priority. Respect this order.

```execution-priority
1. agt-seq-workflow-compactor
2. agt-seq-prompt-compressor
[ other agents ]
Always Last: agt-seq-file-guide 
```

Run the following loop:

- Run a sub-agent from the list ( by priority )
- provide it the request file path
- Wait for it to finish
- Run the next sub-agent for the next selected agent

Over.
