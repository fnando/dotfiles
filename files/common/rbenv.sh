rbenv_exists=`which rbenv > /dev/null`

if [[ "$?" == "0" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  eval "$(rbenv init -)"
fi
