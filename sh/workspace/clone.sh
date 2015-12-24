# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clone.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 20:05:34 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 20:34:24 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

echo $CW8 $CYE"erase and re-clone ~/42/workspace from github [y/n]"$CWH
read -r confirm
if [ "$confirm" != "y" ]
then
	echo $CKO $CRE"Re-clone workspace canceled!"$CWH
	exit 1;
fi
echo $CW8 $CYE"rm -rf ~/42/workspace"$CWH
rm -rf ~/42/workspace
echo $CW8 $CYE"clone github.com/nesthub/workspace.git"$CWH
git clone https://github.com/nesthub/workspace.git ~/42/workspace
