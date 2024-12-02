export DOTFILES_LOADED="true"
export SHELL_NAME="zsh"
export XDG_CONFIG_HOME=$HOME/.config

typeset -U path PATH
autoload -Uz add-zsh-hook

zsh_dir=$XDG_CONFIG_HOME/zsh

source $zsh_dir/utils.sh

before_hook="$XDG_CONFIG_HOME/zsh-user/before.sh"
after_hook="$XDG_CONFIG_HOME/zsh-user/after.sh"

_source-file-if-exists $before_hook

source $zsh_dir/exports.sh
source $zsh_dir/options.sh
source $zsh_dir/keybindings.sh
source $zsh_dir/asdf.sh
source $zsh_dir/cd.sh
source $zsh_dir/md.sh
source $zsh_dir/bundler.sh
source $zsh_dir/psgrep.sh
source $zsh_dir/tmux.sh
source $zsh_dir/starship.sh
source $zsh_dir/aliases.sh
source $zsh_dir/fzf.sh
source $zsh_dir/zinit.sh

_source-file-if-exists $after_hook

# Ensure these dirs are always first in the PATH
_prepend-path "$HOME/.cargo/bin"
_prepend-path "$HOME/.bin"
_prepend-path "$HOME/.local/bin"
_prepend-path "./bin"
_prepend-path "./node_modules/.bin"
