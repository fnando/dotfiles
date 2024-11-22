if [[ -x "$(which go)" ]]; then
  source ~/.asdf/plugins/golang/set-env.zsh
  export GOPATH="${GOPATH:-$HOME/Projects/golang}"
  export PATH="$GOPATH/bin:$(go env GOROOT)/bin:$PATH"
fi
