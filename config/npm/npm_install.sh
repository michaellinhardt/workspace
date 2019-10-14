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

globalInstall "npm@latest"
globalInstall "prettyjson"
globalInstall "yarn"
globalInstall "npx"
globalInstall "pm2"
globalInstall "nodemon"
globalInstall "electron"
globalInstall "knex"
globalInstall "mocha"
globalInstall "prettier"
globalInstall "standard"
globalInstall "react-native-cli"

# linting
globalInstall "eslint"
globalInstall "babel-eslint"
globalInstall "eslint-config-standard"
globalInstall "eslint-config-standard-react"
globalInstall "eslint-config-standard-jsx"
globalInstall "eslint-plugin-react"
globalInstall "eslint-config-prettier"
globalInstall "eslint-plugin-prettier"
globalInstall "@babel/core"
globalInstall "@babel/node"
globalInstall "@babel/preset-env"
globalInstall "@babel/cli"
