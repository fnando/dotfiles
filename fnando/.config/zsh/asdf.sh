# Always use ruby-build from master when running `asdf install ruby`.
export ASDF_RUBY_BUILD_VERSION=master

# https://github.com/asdf-community/asdf-golang
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

asdf_file="$HOME/.asdf/asdf.sh"
asdf_golang_file=$HOME/.asdf/plugins/golang/set-env.zsh

if [[ -f "$asdf_file" ]]; then
  unset GEM_HOME
  unset GEM_PATH
  unset NPM_HOME
  unset NODE_PATH

  source "$asdf_file"
fi

if [[ -f "$asdf_golang_file" ]]; then
  source "$asdf_golang_file"
  export GOPATH="${GOPATH:-$HOME/Projects/golang}"

  _prepend-path "$GOPATH/bin"
  _prepend-path "$(go env GOROOT)/bin"
fi
