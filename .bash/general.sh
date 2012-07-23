alias ll="ls -Glahs"
alias psgrep="ps aux | grep -v grep | grep"

export PATH="./bin:$PATH"
export PS1="\n[vagrant] \w\n$ "
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CDPATH=.:/vagrant
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="&:ls:cd ~:cd .."

shopt -s cdspell
shopt -s nocaseglob
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s progcomp
shopt -s histappend
shopt -s globstar
shopt -s autocd
shopt -s dirspell

set +o ignoreeof
set bell-style none

unset MAILCHECK                           # disable "you have mail" warning
ulimit -S -c 0                            # disable core dump

if [ -d /vagrant ]; then
  cd /vagrant
fi

