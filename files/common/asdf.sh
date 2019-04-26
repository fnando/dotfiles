if [[ -x "$(which brew)" ]]; then
  export ASDF_DIR=$(brew --prefix asdf)
  asdf_file="$ASDF_DIR/asdf.sh"
  asdf_completion_file="$(brew --prefix)/etc/bash_completion.d/asdf.bash"
else
  asdf_file="$HOME/.asdf/asdf.sh"
  asdf_completion_file="$HOME/.asdf/completions/asdf.bash"
fi

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH
  source "$asdf_file"
  source "$asdf_completion_file"
fi
