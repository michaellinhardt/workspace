# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gpush.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 15:29:16 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 18:17:53 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

# Affiche le status et controle le retour, exit si ce nest pas un dossier git
echo $CW8 $CYE"git status -s"$CWH
git status -s
if [ "$?" -eq 128 ]
then
		echo $CKO $CRE "not a git repository... tard!"$CWH
		exit 0
fi
# Verifie si le dossier git actuel necessite une mise a jour
[[ -z $(git status --porcelain) ]] && echo $CKO $CRE "this branch is clean.. tard!"$CWH && exit 0;
# Si aucun argument transmit on recupere la raison du commit et la liste a push
# si raison du commit est vide on stop
# si aucune list a push on push tout
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
	fi
# Si un argument transmit on push tout avec comme commit l'argument transmit
else
	# la raison du commit est transmise a lappel du script
	commit=$*
	file="--all"
fi
# Execute l'operation
echo $CW8 $CYEL"git add "$file$CWH
git add $file
echo $CW8 $CYEL"git commit -m \""$commit"\""$CWH
git commit -m "$commit"
git push
exit 0
