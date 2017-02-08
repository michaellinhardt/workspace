# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gpush.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 15:29:16 by mlinhard          #+#    #+#              #
#    Updated: 2017/01/26 10:21:51 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

sh ~/42/workspace/sh/git/gsetup.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/git/gstatus.sh
[[ $? != 0 ]] && exit 1;
# Si aucun argument transmit on recupere la raison du commit et la liste a push
# si raison du commit est vide on stop
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
	# la raison du commit est transmise a lappel du script
	commit=$*
	file="--all"
	# Demande confirmation
	#echo $CW8 $CYE"Press enter to confirm or send any key to cancel.."$CWH
	#read -r verify
	#if [ $verify ]
	#then
	#	echo $CKO $CRE"Canceled!"$CWH
	#	exit 0
	#fi
fi
# Execute l'operation
echo $CW8 $CYE"git add "$file$CWH
git add $file
echo $CW8 $CYE"git commit -m \""$commit"\""$CWH
git commit -m "$commit"
echo $COK $CGR"Done! (not pushed!)"$CWH
exit 0
