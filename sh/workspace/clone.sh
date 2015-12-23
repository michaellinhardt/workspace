# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clone.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 20:05:34 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 20:13:08 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

echo "erase and re-clone ~/42/workspace from github [y/n]"
read -r confirm
if [ "$confirm" != "y" ]
then
	echo "Canceled!"
	exit 1;
fi
echo "go"
