export BUNDLER_EDITOR=subl
export GEM_EDITOR="subl"
export EDITOR="subl -w"
export VISUAL="$EDITOR"
git config --replace-all --global core.editor $EDITOR
