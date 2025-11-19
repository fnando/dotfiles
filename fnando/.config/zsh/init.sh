export DOTFILES_LOADED="true"
export SHELL_NAME="zsh"
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

typeset -U path PATH
fpath=($XDG_CONFIG_HOME/zsh-completions $fpath)
autoload -Uz compinit
autoload -Uz add-zsh-hook
compinit -i

zsh_dir=$XDG_CONFIG_HOME/zsh

source $zsh_dir/utils.sh

before_hook="$XDG_CONFIG_HOME/zsh-user/before.sh"
after_hook="$XDG_CONFIG_HOME/zsh-user/after.sh"

_source-file-if-exists $before_hook

source $zsh_dir/exports.sh
source $zsh_dir/options.sh
source $zsh_dir/keybindings.sh
source $zsh_dir/mise.sh
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

# Ensure there's a ruby dir per version.
current_ruby=$(mise ls ruby -c --json | jq --raw-output '.[0].version')
export GEM_HOME="$INSTALL_DIR/ruby/$current_ruby"
export GEM_INSTALL="$GEM_HOME"
_prepend-path "$GEM_HOME/bin"

# Ensure these dirs are always first in the PATH
_prepend-path "$HOME/.cargo/bin"
_prepend-path "$HOME/.bin"
_prepend-path "$HOME/.local/bin"
_prepend-path "$HOME/.local/share/mise/shims"
_prepend-path "./bin"
_prepend-path "./node_modules/.bin"
