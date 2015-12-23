# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gpush.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 15:29:16 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 18:01:33 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

# Verifi quon est dans un dossier git, si oui affiche le status sinon exit
echo $CW8 $CYE"git status -s"$CWH
git status -s
if [ "$?" -eq 128 ]
then
		echo $CKO $CRE "not a git repository... tard!"
		exit 0
fi
[[ -z $(git status) ]] && echo $CKO $CRE "this branch is clean, no need to push... tard!" && exit 0;
#is_git=$( git status -s )
#if [ "$is_git" == "true" ]
#then
#	echo $CKO $CRE"not in a git directory.. tard!"
#	exit 1
#fi
# Aucun argument transmit,
# on demande la raison du commit et on push all,
# si raison du commit vide on annule
if [ $# -lt 1 ]
then
	# recupere la raison du commit
	echo $CW8 $CYE"Enter commit description or leave blank for cancel.."$CWH
	read -r commit
	# cancel si aucune raison
	if [ ! $commit ]
	then
		echo $CKO $CRE"Canceled!"$CWH
		exit 0
	fi
	# recupere la liste des fichiers a push
	echo $CW8 $CYE"Enter file list or leave blank for all.."$CWH
	read -r file
	if [ ! $file ]
	then
		file="--all"
		echo $file
		exit 0
	fi
	exit 0
fi

exit 0
