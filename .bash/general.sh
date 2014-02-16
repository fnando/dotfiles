alias ll="ls -Glahs"
alias psgrep="ps aux | grep -v grep | grep"
alias ri="ri -f ansi"
alias reload="source ~/.bash_profile"
alias pcat="pygmentize -f terminal256 -O style=tango -g"

export INSTALL_DIR=$HOME/local
export EDITOR=vim
export VISUAL=vim
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$INSTALL_DIR/bin:$INSTALL_DIR/ruby/gems/bin:$INSTALL_DIR/node/npm/bin"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CDPATH=.:/vagrant:/Projects:$HOME:$HOME/Projects
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export GEM_HOME=$INSTALL_DIR/ruby/gems
export GEM_PATH=$INSTALL_DIR/ruby/gems
export CDHISTORY="/tmp/cd-$USER"
export LESS="-REX"

for option in autocd cdspell cmdhist dotglob extblog dirspell globstar histappend nocaseglob no_empty_cmd_completion checkwinsize; do
  tmp="$(shopt -q "$option" 2>&1 > /dev/null | grep "invalid shell option name")"
  if [ '' == "$tmp" ]; then
    shopt -s "$option"
  fi
done

set -o ignoreeof
set bell-style none

unset MAILCHECK                           # Disable "you have mail" warning
ulimit -S -c 0                            # Disable core dump

if [ ! -f $CDHISTORY ]; then              # Only autocd when the $CDHISTORY file
  if [ -d /Projects ]; then               # cannot be found. In this case, try
    cd /Projects                          # to find the /Projects directory,
  elif [ -d /vagrant ]; then              # defaulting to the vagrant directory.
    cd /vagrant
  fi
fi

# Try to load homebrew's config.
# If it doesn't exist, load the vendored script.
script=/usr/local/etc/bash_completion

if [[ -f $script ]]; then
  source $script
else
  source $HOME/.bash/bash_completion.sh
fi
