bindkey -e
cdpath=( . ~ ~/Projects )
fpath+=($XDG_CONFIG_HOME/zsh-functions)
setopt always_to_end
setopt auto_menu
setopt auto_name_dirs
setopt auto_pushd
setopt auto_cd
setopt complete_in_word
setopt extended_glob
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt long_list_jobs
setopt no_beep
setopt no_global_rcs
setopt no_hist_beep
setopt no_list_beep
setopt no_nomatch
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_minus
setopt share_history
unsetopt correct_all
unsetopt menu_complete
unsetopt flow_control

# case-insensitive completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

set -o ignoreeof
set bell-style none
ulimit -S -c 0
unset MAILCHECK

_noglob-command "git"
_noglob-command "npm"
_noglob-command "bower"
_noglob-command "ri"
_noglob-command "rake"
_noglob-command "http"
_noglob-command "ll"
