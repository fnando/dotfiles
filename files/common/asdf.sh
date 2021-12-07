export ASDF_DIR=$(brew --prefix --installed asdf 2> /dev/null)

if [[ "$ASDF_DIR" == "" ]]; then
  asdf_file="$HOME/.asdf/asdf.sh"
else
  asdf_file="$ASDF_DIR/libexec/asdf.sh"
fi

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH

  source "$asdf_file"
fi
