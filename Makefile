DOT_FILES = .zshrc .vimrc .vim .irbrc .gitconfig

all: zsh vim irb git

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

irb: $(foreach f, $(filter .irb%, $(DOT_FILES)), link-dot-file-$(f))

git: $(foreach f, $(filter .git%, $(DOT_FILES)), link-dot-file-$(f))

.PHONY:clean
clean: $(foreach, $(DOT_FILES), unlink-dot-file(f))

link-dot-file-%: %
	@echo "Create Symlink $< => $(HOME)/$<"
	@ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	@echo "Remove Symlink $(HOME)/$<"
	@$(RM) $(HOME)/$<
