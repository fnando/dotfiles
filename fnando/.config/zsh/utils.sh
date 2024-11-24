source-file-if-exists() {
  file="$1"

  if [[ -f "$file" ]]; then
    source "$file"
  fi
}
