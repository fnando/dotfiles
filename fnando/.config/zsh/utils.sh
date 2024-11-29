_source-file-if-exists() {
  source "$1" || true
}

_noglob-command() {
  name=$1
  eval "alias $name='noglob $name'"
}

_prepend-path() {
  path=($1 "$path[@]")
}

_append-path() {
  path+=($1)
}
