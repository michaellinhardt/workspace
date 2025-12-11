# Request

Do not read any file now, wait to be instructed to do it.

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

Warning, when `agt-seq-file-guide` is selected, don't execute it during the loop

- Run a sub-agent from the list ( by priority )
- provide it the request file path
- Wait for it to finish
- Run the next sub-agent for the next selected agent

Now execute a /compact

If selected give the request file to `agt-seq-file-guide`, take the file guide in return.

Finally, read and execute the file instructions, using the file guide when provided.