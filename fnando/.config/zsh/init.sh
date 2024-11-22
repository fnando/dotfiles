export DOTFILES_LOADED="true"
export SHELL_NAME="zsh"

autoload -U compinit
compinit -i

config_dir=$HOME/.config
zsh_dir=$config_dir/zsh
before_hook="$config_dir/zsh-user/before.sh"
after_hook="$config_dir/zsh-user/after.sh"

if [[ -f $before_hook ]]; then
  source $before_hook
fi

source $zsh_dir/exports.sh
source $zsh_dir/specific.sh
source $zsh_dir/other.sh
source $zsh_dir/keybindings.sh
source $zsh_dir/options.sh
source $zsh_dir/asdf.sh
source $zsh_dir/cd.sh
source $zsh_dir/md.sh
source $zsh_dir/rscp.sh
source $zsh_dir/bundler.sh
source $zsh_dir/psgrep.sh
source $zsh_dir/tmux.sh
source $zsh_dir/cargo.sh
source $zsh_dir/starship.sh
source $zsh_dir/go.sh
source $zsh_dir/aliases.sh
source $zsh_dir/zsh-plugins.sh
source $zsh_dir/path.sh
source $zsh_dir/autojump.sh
source $zsh_dir/android-studio.sh

if [[ -f $after_hook ]]; then
  source $after_hook
fi
