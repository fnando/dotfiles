bindkey -e
cdpath=( . /vagrant /Projects ~ ~/Projects )
setopt nobeep
setopt nohistbeep
setopt nolistbeep
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt auto_pushd
setopt autocd
setopt complete_in_word
unsetopt correctall
setopt extendedglob
setopt extendedhistory
setopt histfindnodups
setopt histignorealldups
setopt histreduceblanks
setopt histsavenodups
setopt histignorespace
setopt incappendhistory
setopt long_list_jobs
setopt pushd_ignore_dups
setopt pushdminus
setopt promptsubst
setopt sharehistory
unsetopt menu_complete
unsetopt flowcontrol
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit
compinit -i
