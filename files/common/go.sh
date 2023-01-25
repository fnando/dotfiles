if [[ -x "$(which go)" ]]; then
  export GOPATH="${GOPATH:-$HOME/Projects/golang}"
  export PATH="$GOPATH/bin:$(go env GOROOT)/bin:$PATH"
fi
