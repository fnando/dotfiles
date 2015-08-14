rbenv_path=$(which rbenv)

if [[ -x "$rbenv_path" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  eval "$(rbenv init -)"
fi
