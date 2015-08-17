rbenv_path=$(which rbenv > /dev/null)

if [[ -x "$rbenv_path" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  eval "$(rbenv init -)"
fi
