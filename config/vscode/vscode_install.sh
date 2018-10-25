#!/bin/bash

. $FUNCTIONS_CONF/brew.sh

caskInstall "VSCODE" "visual-studio-code"

code --install-extension shan.code-settings-sync

cp $VSCODE_CONF/syncLocalSettings.json ~/Library/Application\ Support/Code/User/syncLocalSettings.json
