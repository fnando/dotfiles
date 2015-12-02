if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  export PATH="$HOME/.rvm/bin:$PATH"
  source $HOME/.rvm/scripts/rvm
fi
