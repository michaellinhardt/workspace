#!/bin/bash

function vscInstallExtension () {
  echo $CW8"code --install-extension $1..."$CWH
  # code --install-extension $1
  code --install-extension $1 &> /dev/null
  if [[ $? != 0 ]] ; then
    echo $CKO"code --install-extension $1 fail"$CWH
  else
    echo $COK"code --install-extension $1 success"$CWH
  fi
}

vscInstallExtension "sashaweiss.block-travel"
vscInstallExtension "coenraads.bracket-pair-colorizer"
vscInstallExtension "chunsen.bracket-select"
vscInstallExtension "dbaeumer.vscode-eslint"
vscInstallExtension "zainchen.json"
vscInstallExtension "pkief.material-icon-theme"
vscInstallExtension "leizongmin.node-module-intellisense"
vscInstallExtension "eg2.vscode-npm-script"
vscInstallExtension "christian-kohler.npm-intellisense"
vscInstallExtension "christian-kohler.path-intellisense"
vscInstallExtension "visualstudioexptteam.vscodeintellicode"
# vscInstallExtension "ms-vsliveshare.vsliveshare"