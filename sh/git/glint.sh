#!/bin/bash

if [ -d ./node_modules/eslint ]; then
  echo $CW8 $CYE"npm run lint"$CWH
  npm run lint
  if [[ $? != 0 ]]; then
    echo $CKO $CRE"You got lint error!"$CWH
    exit 1;
  else
    echo $COK $CGR"Lint is ok!"$CWH
    exit 0;
  fi;
else
  echo $COK $CGR"This repo dont have eslint config."$CWH
  exit 0;
fi;
exit 0;
