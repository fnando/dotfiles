asdf_file="/usr/local/opt/asdf/asdf.sh"

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH
  source "$asdf_file"
  source "$(brew --prefix)/etc/bash_completion.d/asdf.bash"
fi
