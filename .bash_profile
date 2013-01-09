source $HOME/.bash/general.sh
source $HOME/.bash/prompt.sh
source $HOME/.bash/gem_completion.sh
source $HOME/.bash/git_completion.sh
source $HOME/.bash/cd.sh

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi
