# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

atom.commands.add 'atom-workspace', 'custom:make-test', ->
	editor = atom.views.getView(atom.workspace.getActiveTextEditor())
	return unless editor
	atom.commands.dispatch(editor, 'window:save-all')
	atom.commands.dispatch(editor, 'terminal-plus:close')
	atom.commands.dispatch(editor, 'terminal-plus:toggle')
