psgrep() {
  if [[ $# == 0 ]]; then
    echo 'Usage: psgrep <process name>'
    return 1
  fi

  output=$(ps aux)
  header=$(print -r -- "$output" | head -n1)
  matches=$(print -r -- "$output" | grep -v grep | grep "$1")

  if [[ -n "$matches" ]]; then
    print -r -- "$header"
    print -r -- "$matches"
    return 0
  fi

  return 2
}
