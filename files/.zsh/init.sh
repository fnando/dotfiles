export DOTFILES_LOADED="true"
export SHELL_NAME="zsh"

autoload -U compinit
compinit -i

source $HOME/.zsh/user.sh
source $HOME/.zsh/exports.sh
source $HOME/.zsh/specific.sh
source $HOME/.zsh/other.sh
source $HOME/.zsh/keybindings.sh
source $HOME/.zsh/options.sh
source $HOME/.zsh/asdf.sh
source $HOME/.zsh/cd.sh
source $HOME/.zsh/md.sh
source $HOME/.zsh/rscp.sh
source $HOME/.zsh/bundler.sh
source $HOME/.zsh/foreman.sh
source $HOME/.zsh/psgrep.sh
source $HOME/.zsh/tmux.sh
source $HOME/.zsh/starship.sh
source $HOME/.zsh/go.sh
source $HOME/.zsh/aliases.sh
source $HOME/.zsh/heroku.sh
source $HOME/.zsh/zsh-plugins.sh
source $HOME/.zsh/path.sh
source $HOME/.zsh/autojump.sh
source $HOME/.zsh/android-studio.sh
