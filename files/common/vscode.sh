export BUNDLER_EDITOR=code
export GEM_EDITOR="code"
export EDITOR="code -w"
export VISUAL="$EDITOR"
git config --replace-all --global core.editor "$EDITOR"
