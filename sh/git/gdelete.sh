#!/bin/bash

if [ $# -lt 1 ]
then
  echo $CKO $CRE"Merci de specifier une branche..!"$CWH
	exit 1
else
	arg=$*
fi

# Execute l'operation

echo $CW8 $CYE"git branch -d "$arg $CWH
git branch -d $arg
[[ $? != 0 ]] && echo $CKO $CRE"Erreur pendant le delete local!"$CWH && exit 1;

echo $CW8 $CYE"git push origin :"$arg $CWH
git push origin :$arg
[[ $? != 0 ]] && echo $CKO $CRE"Erreur pendant le delete distant!"$CWH && exit 1;

echo $CW8 $CYE"git remote prune origin" $CWH
git remote prune origin
[[ $? != 0 ]] && echo $CKO $CRE"Erreur pendant le delete des branch remote!"$CWH && exit 1;

echo $COK $CGR"Done!"$CWH
exit 0
