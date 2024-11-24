# Always use ruby-build from master when running `asdf install ruby`.
export ASDF_RUBY_BUILD_VERSION=master

asdf_file="$HOME/.asdf/asdf.sh"

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH

  source "$asdf_file"
fi
