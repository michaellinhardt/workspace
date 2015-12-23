# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 18:45:20 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 20:35:39 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash
# sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/nesthub/workspace/master/install.sh)"

# Include colors
echo "[ W8 ] include colors var"
curl -fsSL https://raw.githubusercontent.com/nesthub/workspace/master/config/zsh/colors

# 0. prepare folder 42 and workspace
mkdir -p ~/42
mkdir -p ~/42/workspace
# 1. Clone ~/42/workspace
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nesthub/workspace/master/sh/workspace/clone.sh)"
if [ "$?" -eq 1 ]
then
	echo $CKO $CRE"Cloning workspace canceled!"$CWH
	exit 1;
fi
echo "ok"
exit 0
