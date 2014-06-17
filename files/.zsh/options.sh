bindkey -e
cdpath=( . /vagrant /Projects ~ ~/Projects )
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt auto_pushd
setopt autocd
setopt complete_in_word
# setopt correct
unsetopt correctall
setopt extendedglob
setopt extendedhistory
setopt histfindnodups
setopt histignorealldups
setopt histreduceblanks
setopt histsavenodups
setopt incappendhistory
setopt long_list_jobs
setopt pushd_ignore_dups
setopt pushdminus
setopt promptsubst
setopt sharehistory
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit
compinit -i
