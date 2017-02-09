# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    gclean.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/23 15:29:16 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/23 18:27:38 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#!/bin/bash

echo $CW8 $CYE"find ./ -name \".DS_Store\" -depth -exec rm {} \;"$CWH
find ./ -name ".DS_Store" -depth -exec rm {} \;
echo $CKO $CRE "Done!"$CWH
exit 0;
