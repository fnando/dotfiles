export INSTALL_DIR=${INSTALL_DIR:-$HOME/local}
export GEM_HOME=${GEM_HOME:-$INSTALL_DIR/ruby/gems}
export GEM_PATH=${GEM_PATH:-$GEM_HOME}
export NPM_HOME=${NPM_HOME:-$INSTALL_DIR/npm}
export NODE_PATH=${NODE_PATH:-./node_modules:$HOME/local/npm/lib/node_modules}
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export EDITOR=${EDITOR:-vim}
export VISUAL=${VISUAL:-vim}
export GREP_COLOR="4;33"
export CDPATH=.:/vagrant:/Projects:$HOME:$HOME/Projects
export HISTSIZE=1000000000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export SAVEHIST=1000000000

if [[ "$(uname -m)" == "arm64" ]]; then
  export HOMEBREW_PREFIX=/opt/homebrew
else
  export HOMEBREW_PREFIX=/usr/local
fi

export PATH="$HOME/bin:$HOME/local/bin:./bin:./node_modules/.bin:$GEM_HOME/bin:$NPM_HOME/bin:$HOME/.bash/bin:$HOME/.zsh/bin:/usr/local/MacGPG2/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin"
export CDHISTORY="/tmp/cd-$USER"
export PAGER="less"
export LESS="-REX"
export LESS_TERMCAP_mb=$'\E[04;33m'
export LESS_TERMCAP_md=$'\E[04;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'
export HOMEBREW_NO_ANALYTICS=1
export GPG_TTY=$(tty)
export WORDCHARS='*?[]~$^()}<>'
