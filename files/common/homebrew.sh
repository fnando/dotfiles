if [[ -x "$(which brew)" ]]; then
  brew() {
    unset -f brew
    source "$(brew --prefix)/Homebrew/completions/zsh/_brew"
    command brew $@
  }
fi
