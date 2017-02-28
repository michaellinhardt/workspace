#!/bin/bash

if [ -d ./node_modules ]; then
  echo $CW8 $CYE"npm run start-dev"$CWH
  npm run start-dev
  exit 0;
else
  echo $CKO $CRE"No node_modules folder here.."$CWH
  exit 1;
fi;
