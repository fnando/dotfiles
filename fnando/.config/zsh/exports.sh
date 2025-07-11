export WORDCHARS=${WORDCHARS//[&=\/;\!#%\{]}
export INSTALL_DIR=${INSTALL_DIR:-$HOME/.local}
export NPM_HOME=${NPM_HOME:-$INSTALL_DIR/npm}
export NODE_PATH=${NODE_PATH:-./node_modules:$HOME/.local/npm/lib/node_modules}
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export EDITOR=${EDITOR:-vim}
export VISUAL=${VISUAL:-vim}
export GREP_COLOR="4;33"
export CDPATH=.:$HOME:$HOME/Projects
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export HISTDUP=erase
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export SAVEHIST=1000000000

if [[ "$(uname -m)" == "arm64" ]]; then
  export HOMEBREW_PREFIX=/opt/homebrew
else
  export HOMEBREW_PREFIX=/usr/local
fi

if [[ "$(uname)" == "Darwin" ]]; then
  export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
  export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
  export LDFLAGS="-L$HOMEBREW_PREFIX/lib"
  export CPPFLAGS="-I$HOMEBREW_PREFIX/include"
fi

test-env() {
  export HELLO=hello-there
}

export PATH="/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin"
_prepend-path "$HOMEBREW_PREFIX/bin"
_prepend-path "$HOMEBREW_PREFIX/sbin"

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
export HOMEBREW_CACHE="/tmp/homebrew-cache"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=~/Library/Fonts"
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_DUMP_DESCRIBE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export DOCKER_CLI_HINTS=false
export DOCKER_TELEMETRY=false
export GPG_TTY=$(tty)
export WORDCHARS='*?[]~$^()}<>'
export ZSH_COMPDUMP=$XDG_CONFIG_HOME/zsh-compdump
export YARN_CACHE_FOLDER=/tmp/yarn-cache
export npm_config_cache=/tmp/npm-cache
