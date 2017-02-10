#!/bin/bash

if [ $# -lt 1 ]
then
  add="--all"
else
	add=$*
fi
# Execute l'operation
echo $CW8 $CYE"git add \""$add"\""$CWH
git add $add
if [ "$?" -eq 0 ]
then
  echo $COK $CGR"File added!"$CWH
  exit 0
else
  echo $CKO $CRE"not a git repository or nothing to add!"$CWH
  exit 1
fi
