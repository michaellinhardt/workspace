#!/bin/bash

if [ $# -lt 1 ]
then
  echo $CKO"Merci de specifier une branche..!"$CWH
	exit 1
else
	arg=$*
fi

# Execute l'operation

echo $CW8"git branch -D "$arg $CWH
git branch -D $arg
[[ $? != 0 ]] && echo $CKO"Erreur pendant le delete local!"$CWH && exit 1;

echo $CW8"git push origin :"$arg $CWH
git push origin :$arg
[[ $? != 0 ]] && echo $CKO"Erreur pendant le delete distant!"$CWH && exit 1;

echo $CW8"git remote prune origin" $CWH
git remote prune origin
[[ $? != 0 ]] && echo $CKO"Erreur pendant le delete des branch remote!"$CWH && exit 1;

echo $COK"Done!"$CWH
exit 0
