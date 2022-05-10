#!/bin/bash

function globalInstall () {
  echo $CW8"npm -g $1 installing..."$CWH
  npm install -g $1 &> /dev/null
  if [[ $? != 0 ]] ; then
    echo $CKO"npm -g $1 install fail"$CWH
  else
    echo $COK"npm -g $1 install success"$CWH
  fi
}

globalInstall "yarn"
globalInstall "npx"
globalInstall "corepack"