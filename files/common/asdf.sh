if [[ -x "$(which brew)" ]]; then
  export ASDF_DIR=$(brew --prefix asdf)
  asdf_file="$ASDF_DIR/asdf.sh"
else
  asdf_file="$HOME/.asdf/asdf.sh"
fi

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH
  source "$asdf_file"
fi
