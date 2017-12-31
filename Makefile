PATH       := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
FILES      := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(FILES)) .config/nvim

all: install

help:
	@echo "make list    : Show dotfiles in this repository"
	@echo "make link    : Create symlink to home directory"
	@echo "make update  : Fetch changes for this repositry"
	@echo "make install : Run make update, deploy"
	@echo "make clean   : Remove symlinks"

list:
	@$(foreach val, $(DOTFILES), /bin/ls -d $(val);)

update:
	git pull origin master

link:
	@echo "--- Create Symlink from dotfiles to home directory. ---"
	@$(foreach val, $(DOTFILES), /bin/ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install: update link
	@exec $$SHELL

clean:
	@echo "--- Remove dot files in your home directory. ---"
	@$(foreach val, $(DOTFILES), /bin/unlink $(HOME)/$(val);)
