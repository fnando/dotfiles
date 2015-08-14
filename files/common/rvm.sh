if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  export PATH="$PATH:$HOME/.rvm/bin"
  source $HOME/.rvm/scripts/rvm
fi
