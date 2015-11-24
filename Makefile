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

VERSION = v0.5

all:
	@echo "$(BLUE)*** [$(YELLOW)MAKEFILE VARIABLE$(BLUE)] $(BLANK)"
	@echo "$(RED)- PATH_ROOT = $(YELLOW)$(PATH_ROOT)"
	@echo "$(RED)- PATH_GITHUB = $(YELLOW)$(PATH_GITHUB)"
	@echo "$(RED)- LOCAL=\"projets/libft\"\n\t$(YELLOW)Path to PATH_ROOT/LOCAL"
	@echo "$(RED)- GIT=\"projet_libft\"\n\t$(YELLOW)Path to PATH_GITHUB/GIT.git"
	@echo "$(BLUE)*** [$(YELLOW)MAKEFILE COMMAND$(BLUE)] $(BLANK)"
	@echo "$(RED)- maj-makefile"
	@echo "$(YELLOW)- \tCopy Makefile from ~/42 to ./"
	@echo "$(RED)- save-makefile"
	@echo "$(YELLOW)- \tSave from ~/42/ to ~/42/env_lib/"
	@echo "$(RED)- clone LOCAL=\"www\" GIT=\"www\""
	@echo "$(YELLOW)- \tClear PATH_ROOT/LOCAL and clone GIT inside"
	@echo "$(RED)- init-projet LOCAL=\"projets/libft\""
	@echo "$(YELLOW)- \tCopy new projet file to PATH_ROOT/LOCAL"

maj-makefile:
	@echo "$(BLUE)*** [$(YELLOW)COPY FROM$(BLUE)] ~/42/Makefile$(BLANK)"
	@cp ~/42/Makefile ./Makefile

-save-makefile:
	@echo "$(BLUE)*** [$(YELLOW)SAVE TO$(BLUE)] ~/42/env_lib/Makefile$(BLANK)"
	@cp ~/42/Makefile ~/42/env_lib/Makefile

save-makefile: -save-makefile status-env

status-env:
	@echo "$(BLUE)*** [$(YELLOW)STATUS$(BLUE)] ~/42/env_lib/Makefile$(BLANK)"
	@cd ~/42/env_lib/ && git status
	@echo cd ~/42/env_lib

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
