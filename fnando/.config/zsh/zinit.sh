export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"

_source-file-if-exists $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

_source-file-if-exists $HOMEBREW_PREFIX/Library/Taps/homebrew/homebrew-command-not-found/handler.sh

autoload -Uz compinit
compinit -i

zinit cdreplay -q
