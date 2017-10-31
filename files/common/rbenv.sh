if [[ -x "$HOME/.rbenv/bin/rbenv" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
