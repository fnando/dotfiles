export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"

_source-file-if-exists $HOMEBREW_PREFIX/opt/zinit/zinit.zsh
_source-file-if-exists $HOME/.local/share/zinit/zinit.zsh

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit cdreplay -q
