export HISTFILE="$HOME/.zsh_history"
WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}
alias reload="source ~/.zshrc"

[[ -x `which git` ]] && alias git="noglob git"
[[ -x `which npm` ]] && alias npm="noglob npm"
[[ -x `which bower` ]] && alias bower="noglob bower"
