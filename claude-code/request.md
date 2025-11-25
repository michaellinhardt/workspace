# Request

Write the script @./scripts/sopai-obsidian-link.sh and add the alias into @./terminal/alias.zsh to use it.

## The Script

The script take a path as argument such as `~/dev/my-code-project` and it will link some specific folders/file from this path into the current folder.

Of course first the script check if the folder exist, if not exit with error message.

If the folder exist, it will create the links:

- from `~/dev/my-code-project/.claude` into `{currentFolder}/claude`
- from `~/dev/my-code-project/dev` into `{currentFolder}/dev`
- from `~/dev/my-code-project/docs` into `{currentFolder}/docs`

That's it.
