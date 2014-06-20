psgrep() {
  if [[ $# == 0 ]]; then
    echo 'Usage: psgrep <process name>'
    return 1
  fi

  output=$(ps aux)
  header=$(echo $output | head -n1)
  matches=$(echo -n $output | grep -v grep | grep $1)

  if [[ "$matches" != "" ]]; then
    echo $header
    echo $matches
    return 0
  fi

  return 2
}
