alias ll="ls -Glahs"
alias ri="ri -f ansi"
alias pcat="pygmentize -f terminal256 -O style=tango -g"
alias hex="openssl rand -hex"
alias path='echo $PATH | tr : "\n" | uniq'
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

psgrep() {
  output=$(ps aux)
  header=$(echo $output | head -n1)
  matches=$(echo -n $output | grep -v grep | grep)

  if [[ "$matches" != "" ]]; then
    echo $header
    echo $matches
  fi
}

# alias psgrep="ps aux | grep -v grep | grep"
