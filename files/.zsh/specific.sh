export HISTFILE="$HOME/.zsh_history"
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}
alias reload="source ~/.zshrc"

noglob-command() {
  name=$1
  bin_path=`which $1 2> /dev/null`
  [[ -x "$bin_path" ]] && eval "alias $name='noglob $bin_path'"
}

noglob-command 'git'
noglob-command 'npm'
noglob-command 'bower'
noglob-command 'ri'
