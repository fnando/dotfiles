if [[ -x "$(which brew)" ]]; then
  brew() {
    source "$(brew --prefix)/Homebrew/completions/zsh/_brew"
    command brew $@
    unset -f brew
  }
fi
