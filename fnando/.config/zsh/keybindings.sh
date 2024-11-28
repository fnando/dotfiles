bindkey -e
bindkey "^[b" emacs-forward-word # ctrl-left
bindkey "^[f" emacs-backward-word # ctrl-right

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # up
bindkey "^[[B" down-line-or-beginning-search # down
bindkey '^u' backward-kill-line  # ctrl-u
bindkey '^d' kill-whole-line  # ctrl-d
bindkey "\e[3~" delete-char # fn-delete
bindkey "^r" history-incremental-search-backward
bindkey "^j" history-search-backward
bindkey "^k" history-search-forward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word
