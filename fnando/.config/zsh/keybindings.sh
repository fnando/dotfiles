bindkey -e
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[b" emacs-backward-word # ctrl-right
bindkey "^[f" emacs-forward-word # ctrl-left
bindkey "^J" emacs-backward-word # ctrl-j
bindkey "^K" emacs-forward-word # ctrl-k
bindkey "^[[A" up-line-or-beginning-search # up
bindkey "^[[B" down-line-or-beginning-search # down
bindkey '^u' backward-kill-line  # ctrl-u
bindkey '^d' kill-whole-line  # ctrl-d
bindkey "^r" history-incremental-search-backward
bindkey "∆" history-search-backward # option-j
bindkey "˚" history-search-forward # option-k
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word
