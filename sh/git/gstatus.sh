# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gstatus.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 15:29:16 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 18:27:38 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

# Affiche le status et controle le retour, exit si ce nest pas un dossier git
echo $CW8 $CYE"git status -s"$CWH
git status -s
if [ "$?" -eq 128 ]
then
		echo $CKO $CRE "not a git repository... tard!"$CWH
		exit 1
fi
# Verifie si le dossier git actuel necessite une mise a jour
[[ -z $(git status --porcelain) ]] && echo $CKO $CRE "this branch is clean.. tard!"$CWH && exit 2;
exit 0;
