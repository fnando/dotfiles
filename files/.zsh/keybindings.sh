bindkey -e
bindkey "[C" emacs-forward-word
bindkey "[D" emacs-backward-word

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey \^U backward-kill-line  # Ctrl+U
bindkey "^[[3~" delete-char # fn-delete
bindkey "^r" history-incremental-search-backward
