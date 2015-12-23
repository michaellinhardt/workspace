# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clone.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 20:05:34 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 20:18:29 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

echo $CW8 $CYE"erase and re-clone ~/42/workspace from github [y/n]"$CWH
read -r confirm
if [ "$confirm" != "y" ]
then
	echo $CKO $CRE"Canceled!"$CWH
	exit 1;
fi
echo "go"
