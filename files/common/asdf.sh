if [[ -f "/usr/local/opt/asdf/asdf.sh" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH
  source "/usr/local/opt/asdf/asdf.sh"
fi
