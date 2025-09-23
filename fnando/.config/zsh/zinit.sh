export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"
export HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$HOMEBREW_PREFIX/Library/Homebrew/command-not-found/handler.sh"

_source-file-if-exists $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

_source-file-if-exists $HOMEBREW_COMMAND_NOT_FOUND_HANDLER

zinit cdreplay -q
