# https://github.com/nesthub/
# PATH VAR 
PATH_ROOT		=	~/42/
PATH_GITHUB		=	https://github.com/nesthub/

# COLOR VAR aaa
RED				=	\033[0;31m
GREEN				=	\033[0;32m
YELLOW			=	\033[0;33m
BLUE				=	\033[0;34m
BLANK				=	\033[0;38m
OK				= $(BLANK)[ $(GREEN)OK $(BLANK)]
FAIL				= $(BLANK)[ $(RED)FAIL $(BLANK)]

#VERSION
VERSION = v0.7

#DOCS
all:
	@echo "$(BLUE)*** [$(YELLOW)MAKEFILE VARIABLE$(BLUE)] $(BLANK)"
	@echo "$(RED)- PATH_ROOT = $(YELLOW)$(PATH_ROOT)"
	@echo "$(RED)- PATH_GITHUB = $(YELLOW)$(PATH_GITHUB)"
	@echo "$(RED)- LOCAL=\"projets/libft\"\n\t$(YELLOW)Path to PATH_ROOT/LOCAL"
	@echo "$(RED)- GIT=\"projet_libft\"\n\t$(YELLOW)Path to PATH_GITHUB/GIT.git"
	@echo "$(BLUE)*** [$(YELLOW)MAKEFILE COMMAND$(BLUE)] $(BLANK)"
	@echo "$(RED)- load-makefile"
	@echo "$(YELLOW)- \tLoad Makefile from ~/42 to ./"
	@echo "$(RED)- save-makefile"
	@echo "$(YELLOW)- \tSave from ~/42/ to ~/42/env_lib/"
	@echo "$(RED)- load-env"
	@echo "$(YELLOW)- \tLoad git env file (~/.vimrc, etc)"
	@echo "$(RED)- save-env"
	@echo "$(YELLOW)- \tSave actual env file (~/.vimrc, etc)"
	@echo "$(RED)- clone LOCAL=\"www\" GIT=\"www\""
	@echo "$(YELLOW)- \tClear PATH_ROOT/LOCAL and clone GIT inside"
	@echo "$(RED)- init-projet LOCAL=\"projets/libft\""
	@echo "$(YELLOW)- \tCopy new projet file to PATH_ROOT/LOCAL"

#DISPLAY GIT STATUS ON env_lib FOLDER
-status-env:
	@echo "$(BLUE)*** [$(YELLOW)STATUS$(BLUE)] ~/42/env_lib/Makefile$(BLANK)"
	@cd ~/42/env_lib/ && git status
	@echo cd ~/42/env_lib

#ROUTINE FOR SAVE ENV CONFIG (Makefile, vimrc, etc)
save-env: -save-env -save-makefile -status-env
-save-env:
	@mkdir -p ~/42/env_lib/conf_file
	@echo "$(BLUE)*** [$(YELLOW)SAVE$(BLUE)] ~/.vimrc$(BLANK)"
	cp ~/.vimrc ~/42/env_lib/conf_file/vimrc

#ROUTINE FOR SAVE MAKEFILE
save-makefile: -save-makefile -status-env
-save-makefile:
	@mkdir -p ~/42/env_lib/makefile
	@echo "$(BLUE)*** [$(YELLOW)SAVE$(BLUE)] ~/42/Makefile$(BLANK)"
	cp ~/42/Makefile ~/42/env_lib/makefile/Makefile

#LOAD ENV CONFIG FILE FROM env_lib
load-env: load-makefile
	@echo "$(BLUE)*** [$(YELLOW)LOAD$(BLUE)] tild_hidden_conf/vimrc$(BLANK)"
	cp ~/42/env_lib/conf_file/vimrc ~/.vimrc
#LOAD MAKEFILE FROM ~/42/ TO CURRENT FOLDER
load-makefile:
	@echo "$(BLUE)*** [$(YELLOW)LOAD$(BLUE)] env_lib/Makefile$(BLANK)"
	cp ~/42/Makefile ./Makefile

#COPY DEFAULT FILE FOR NEW PROJECT
init-projet:
ifeq ($(LOCAL), )
	$(error Syntaxe ex: init-projet LOCAL="projets/libft")
endif
	@echo "$(BLUE)*** [$(YELLOW)PATH VAR$(BLUE)] $(BLANK)"
	@echo "$(OK) LOCAL = $(PATH_ROOT)$(LOCAL)"
	@echo "$(BLUE)*** [$(YELLOW)MKDIR$(BLUE)] inc, src, lib, docs $(BLANK)"
	@mkdir -p $(PATH_ROOT)$(LOCAL)/inc
	@echo "$(OK) mkdir $(PATH_ROOT)$(LOCAL)/inc"
	@mkdir -p $(PATH_ROOT)$(LOCAL)/docs
	@echo "$(OK) mkdir $(PATH_ROOT)$(LOCAL)/docs"
	@mkdir -p $(PATH_ROOT)$(LOCAL)/src
	@echo "$(OK) mkdir $(PATH_ROOT)$(LOCAL)/src"
	@mkdir -p $(PATH_ROOT)$(LOCAL)/lib
	@echo "$(OK) mkdir $(PATH_ROOT)$(LOCAL)/lib"
	@echo "$(BLUE)*** [$(YELLOW)COPY$(BLUE)] $(BLANK)"
	@cp $(PATH_ROOT)/Makefile $(PATH_ROOT)$(LOCAL)/Makefile
	@echo "$(OK) cp $(PATH_ROOT)/Makefile $(PATH_ROOT)$(LOCAL)/Makefile"

#RE-CLONE A REPO
clone:
ifeq ($(LOCAL), )
	$(error Syntaxe ex: clone LOCAL="projets/libft" GIT="projet_libft")
endif
ifeq ($(GIT), )
	$(error Syntaxe ex: clone LOCAL="projets/libft" GIT="projet_libft")
endif
	@echo "$(BLUE)*** [$(YELLOW)PATH VAR$(BLUE)] $(BLANK)"
	@echo "$(OK) LOCAL = $(PATH_ROOT)$(LOCAL)"
	@echo "$(OK) GIT = $(PATH_GITHUB)$(GIT).git"
	@echo "$(BLUE)*** [$(YELLOW)REMOVE$(BLUE)] $(PATH_ROOT)$(LOCAL)$(BLANK)"
	@rm -rf $(PATH_ROOT)$(LOCAL)	
	@echo "$(BLUE)*** [$(YELLOW)CLONE$(BLUE)] $(PATH_GITHUB)$(GIT).git$(BLANK)"
	@git clone $(PATH_GITHUB)$(GIT).git $(PATH_ROOT)$(LOCAL)
	@echo "$(BLUE)*** [$(YELLOW)DONE$(BLUE)] LS $(PATH_ROOT)$(LOCAL)$(BLUE)"
	@ls -la $(PATH_ROOT)$(LOCAL)
	@echo -n "$(BLANK)"
	@pwd
