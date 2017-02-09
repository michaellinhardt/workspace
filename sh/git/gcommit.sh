#!/bin/bash

sh ~/42/workspace/sh/git/glint.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/sys/dstore.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/git/gsetup.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/git/gstatus.sh
[[ $? != 0 ]] && exit 1;
# si aucune list a push on push tout
if [ $# -lt 1 ]
then
	# recupere la raison du commit
	echo $CW8 $CYE"Enter commit description or leave blank for cancel.."$CWH
	read -r commit
	# cancel si aucune raison
	if [ ! "$commit" ]
	then
		echo $CKO $CRE"Canceled!"$CWH
		exit 0
	fi
	# recupere la liste des fichiers a push
	echo $CW8 $CYE"Enter file list or leave blank for all.."$CWH
	read -r file
	if [ ! "$file" ]
	then
		file="--all"
	fi
# Si un argument transmit on push tout avec comme commit l'argument transmit
else
	commit=$*
	file="--all"
fi
# Execute l'operation
echo $CW8 $CYE"git add "$file$CWH
git add $file
echo $CW8 $CYE"git commit -m \""$commit"\""$CWH
git commit -m "$commit"
echo $COK $CGR"Done! (not pushed!)"$CWH
exit 0
