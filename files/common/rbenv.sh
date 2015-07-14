if [[ -f "$HOME/.rbenv/bin/rbenv" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  eval "$(rbenv init -)"
fi
