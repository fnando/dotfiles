if [[ -f "$HOME/.rvm/scripts/rvm" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  source $HOME/.rvm/scripts/rvm
fi
