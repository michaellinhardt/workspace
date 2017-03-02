#!/bin/bash

if [ $# -lt 1 ]
then
  echo $CKO $CRE"Merci de specifier une branche..!"$CWH
	exit 1
else
	arg=$*
fi

# Execute l'operation

echo $CW8 $CYE"git checkout -b "$arg $CWH
git checkout -b $arg
[[ $? != 0 ]] && echo $CKO $CRE"Erreur pendant le creation local de la branch!"$CWH && exit 1;

echo $CW8 $CYE"git push --set-upstream origin "$arg $CWH
git push --set-upstream origin $arg
[[ $? != 0 ]] && echo $CKO $CRE"Erreur pendant la creation distante de la branch!"$CWH && exit 1;

echo $COK $CGR"Done!"$CWH
exit 0
