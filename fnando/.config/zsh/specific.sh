export HISTFILE="$HOME/.zsh_history"
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}
alias reload="source ~/.zshrc"

noglob-command() {
  name=$1
  eval "alias $name='noglob $name'"
}

noglob-command 'git'
noglob-command 'npm'
noglob-command 'bower'
noglob-command 'ri'
noglob-command 'rake'
noglob-command 'http'
