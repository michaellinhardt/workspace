# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlinhard <mlinhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/08 03:40:52 by mlinhard          #+#    #+#              #
#    Updated: 2015/12/11 10:41:13 by mlinhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# https://github.com/nesthub/
# PATH VAR
PATH_ROOT		= ~/42/
PATH_CURR		= $(shell pwd)
ifneq ($(wildcard $(PATH_CURR)/.path_root), )
	PATH_PROJET = $(PATH_CURR)
else
ifneq ($(wildcard $(PATH_CURR)/../.path_root), )
	PATH_PROJET = $(PATH_CURR)/..
else
	PATH_PROJET = 0
endif
endif

# COLOR VAR
RED				= \033[0;31m
GREEN			= \033[0;32m
YELLOW			= \033[0;33m
BLUE			= \033[0;34m
BLANK			= \033[0;38m
OK				= $(BLANK)[ $(GREEN)OK $(BLANK)]
FAIL			= $(BLANK)[ $(RED)FAIL $(BLANK)]

#COMPILATION VAR
CC				= gcc
CFLAGS			= -Wall -Werror -Wextra

#FOLDER PATH
FOLDER_SRC		= ./src/
FOLDER_OBJ		= ./obj/
FOLDER_INC		= ./inc/
FOLDER_LIB		= ./lib/

#PROJET VAR
NAME			= libft.a
LIST_HEADER		= libft.h
LIST_SRC		= ft_strlen.c ft_strcmp.c ft_strdup.c ft_strcpy.c ft_strncpy.c \
				  ft_strcat.c ft_strncat.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
				  ft_strstr.c ft_strnstr.c ft_strncmp.c ft_putendl.c ft_itoa.c \
				  ft_putchar.c ft_putchar_fd.c ft_putstr.c ft_putstr_fd.c \
				  ft_putnbr_fd.c ft_putnbr.c ft_stralloc.c ft_putendl_fd.c \
				  ft_islower.c ft_isupper.c ft_toupper.c ft_tolower.c \
				  ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_lstmap.c \
				  ft_isprint.c ft_isspace.c ft_strdel.c ft_strclr.c ft_striter.c \
				  ft_striteri.c ft_strmap.c ft_strmapi.c ft_strequ.c ft_strnequ.c \
				  ft_memset.c ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c \
				  ft_memchr.c ft_memcmp.c ft_memalloc.c ft_memdel.c ft_strnew.c \
				  ft_atoi.c ft_strsub.c ft_strjoin.c ft_strtrim.c ft_strsplit.c \
				  ft_lstnew.c ft_lstdelone.c ft_lstdel.c ft_lstadd.c ft_lstiter.c \
				  ft_strtolower.c ft_strtoupper.c ft_countwords.c ft_pow.c

#BUILD LIST
LIST_OBJ		= $(subst .c,.o,$(LIST_SRC))
#SRCS			= $(addprefix $(FOLDER_SRC), $(LIST_SRC))
#OBJS			= $(addprefix $(FOLDER_OBJ), $(LIST_OBJ))

all: $(NAME)

#TRANSFORM .c FILE INTO .o WITH OBJ FOLDER
#$(FOLDER_OBJ)%.o: $(FOLDER_SRC)%.c
#@mkdir -p $(FOLDER_OBJ)
#$(CC) $(CFLAGS) -I$(FOLDER_INC) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -I./ -c -o $@ $<

$(NAME): $(LIST_OBJ)
	ar rc $(NAME) $(LIST_OBJ)
	ranlib $(NAME)

clean:
	rm -rf $(LIST_OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

clear:
	clear

test: clear re
	$(CC) $(CFLAGS) -I./ main.c libft.a
	@echo "$(YELLOW)********************"
	@echo "$(YELLOW)***   ./a.out    ***"
	@echo "$(YELLOW)********************"
	@./a.out
	@echo "$(BLANK)"

# TEST FOR LIBFT
moulitest: -is-project-folder -is-dev-folder clear re moulitest-
unitest: -is-project-folder -is-dev-folder clear re unitest-
moulitest-:
	@cd $(PATH_PROJET)/moulitest && make libft_bonus
unitest-:
	rm -rf $(PATH_PROJET)/unit-test/libft
	cp -R $(PATH_PROJET)/dev/ $(PATH_PROJET)/unit-test/libft
	@cd $(PATH_PROJET)/unit-test/libft-unit-test && make re && make f

.PHONY: clean fclean re help push clone

vardump:
	@echo PATH_CURR: $(PATH_CURR)
	@echo PATH_PROJET: $(PATH_PROJET)

# display status for both git42 and github in the current project
status: -is-project-folder save-dev -status
-status:
ifeq ($(wildcard $(PATH_PROJET)/git42/.git), )
	@echo "$(FAIL)$(YELLOW) $(PATH_PROJET)/git42/ is not a git repository.$(BLANK)"
else
	@cd $(PATH_PROJET)/git42 && echo "$(OK) $(YELLOW)$(PATH_PROJET)/git42/ git status $(BLANK)" && git status -s
endif
ifeq ($(wildcard $(PATH_PROJET)/github/.git), )
	@echo "$(FAIL)$(YELLOW) $(PATH_PROJET)/github/ is not a git repository.$(BLANK)"
else
	@cd $(PATH_PROJET)/github && echo "$(OK) $(YELLOW)$(PATH_PROJET)/github/ git status$(BLANK)" && git status -s
endif

#VERIF IF THE CURRENT VAR PATH_PROJET RETURN TO A PROJECT FOLDER
-is-project-folder:
ifeq ($(PATH_PROJET),0)
	$(error Cant find .path_root file to define folder project)
endif
# VERIF IS CURRENT FOLDER IS DEV FOLDER
-is-dev-folder:
ifneq ($(wildcard $(PATH_CURR)/.path_root), )
	$(error You are not in dev folder!)
endif

#PUSH TO BOTH GIT42 AND GItHUB
push: -is-project-folder -push-var-verif push-git42 push-github -status

#PUSH TO GITHUB
push-github: -is-project-folder -push-var-verif
ifeq ($(wildcard $(PATH_PROJET)/github/.git), )
	@echo "$(FAIL)$(YELLOW) $(PATH_PROJET)/github/ is not a git repository.$(BLANK)"
else
	@echo "$(OK)$(YELLOW) $(PATH_PROJET)/github/ push$(BLANK)"
	@cd $(PATH_PROJET)/github && git add $(ADD) && git commit -m "$(COMMIT)" && git push
endif

#PUSH TO GIT42
push-git42: -is-project-folder -push-var-verif
ifeq ($(wildcard $(PATH_PROJET)/git42/.git), )
	@echo "$(FAIL)$(YELLOW) $(PATH_PROJET)/git42/ is not a git repository.$(BLANK)"
else
	@echo "$(OK)$(YELLOW) $(PATH_PROJET)/git42/ push$(BLANK)"
	@cd $(PATH_PROJET)/git42 && git add $(ADD) && git commit -m "$(COMMIT)" && git push
endif

#VERIF IF CORRECT VAR ARE GIVIN TO THE PUSH RULE
-push-var-verif:
ifeq ($(ADD), )
	$(error Syntaxe ex: push ADD="main.c" COMMIT="commit message")
endif
ifeq ($(COMMIT), )
	$(error Syntaxe ex: push ADD="main.c" COMMIT="commit message")
endif

#SAVE CONTENT OF DEV FOLDER TO GIT42 AND GITHUB FOLDER
save-dev: -is-project-folder
	@echo "$(OK)$(YELLOW) Reseting swap folder..$(BLANK)"
	@rm -rf $(PATH_PROJET)/swap
	@mkdir -p $(PATH_PROJET)/swap
	@echo "$(OK)$(YELLOW) Clear git42 folder..$(BLANK)"
	@touch $(PATH_PROJET)/git42/prevent_mv_bug
	@mv $(PATH_PROJET)/git42/* $(PATH_PROJET)/swap/
	@rm -rf $(PATH_PROJET)/swap
	@mkdir -p $(PATH_PROJET)/swap
	@echo "$(OK)$(YELLOW) Clear github folder..$(BLANK)"
	@touch $(PATH_PROJET)/github/prevent_mv_bug
	@mv $(PATH_PROJET)/github/* $(PATH_PROJET)/swap/
	@rm -rf $(PATH_PROJET)/swap
	@echo "$(OK)$(YELLOW) Copy dev folder to both git42 and github..$(BLANK)"
	@cp -r $(PATH_PROJET)/dev/* $(PATH_PROJET)/git42/
	@cp -r $(PATH_PROJET)/dev/* $(PATH_PROJET)/github/

#DOCS
help:
	@echo "$(RED)* $(YELLOWW) Comming soon..."

#DISPLAY GIT STATUS ON config_workspace FOLDER
-status-workspace:
	@echo "$(OK)$(YELLOW) ~/42/config_workspace git status$(BLANK)"
	@cd ~/42/config_workspace/ && git status -s

#ROUTINE FOR SAVE ENV CONFIG
save-workspace: -save-workspace -save-makefile -push-workspace -status-workspace
-save-workspace:
	@mkdir -p ~/42/config_workspace/conf_file
	@echo "$(OK)$(YELLOW) copy ~/.zshrc$(BLANK)"
	@cp ~/.zshrc ~/42/config_workspace/conf_file/zshrc
	@echo "$(OK)$(YELLOW) copy ~/.vimrc$(BLANK)"
	@cp ~/.vimrc ~/42/config_workspace/conf_file/vimrc
#ROUTINE FOR SAVE MAKEFILE
save-makefile: -save-makefile
-save-makefile:
	@echo "$(OK)$(YELLOW) copy ~/42/Makefile$(BLANK)"
	@cp ~/42/Makefile ~/42/config_workspace/Makefile
#PUSH THE WORKSPACE SAVE
-push-workspace:
	@echo "$(OK)$(YELLOW) push ~/42/config_workspace/$(BLANK)"
	@cd ~/42/config_workspace/ && git add --all && git commit -m "save config" && git push

#LOAD ENV CONFIG FILE FROM config_workspace
load-workspace:
	@echo "$(BLUE)*** [$(YELLOW)LOAD$(BLUE)] conf_file/zshrc$(BLANK)"
	cp ~/42/config_workspace/conf_file/zshrc ~/.zshrc
	@echo "$(BLUE)*** [$(YELLOW)LOAD$(BLUE)] conf_file/vimrc$(BLANK)"
	cp ~/42/config_workspace/conf_file/vimrc ~/.vimrc
