shopt -s cdspell
shopt -s nocaseglob
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s progcomp
shopt -s histappend
#shopt -s globstar
#shopt -s autocd
#shopt -s dirspell

set -o ignoreeof
set bell-style none

unset MAILCHECK                           # disable "you have mail" warning
ulimit -S -c 0                            # disable core dump
bind "set completion-ignore-case on"      # ignore case on bash completion
bind "set mark-symlinked-directories on"  # add trailing slash to symlinked directories
