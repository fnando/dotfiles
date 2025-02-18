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

test-env() {
  export HELLO=hello-there
}

_append-path "/usr/local/bin"
_append-path "/usr/bin"
_append-path "/usr/sbin"
_append-path "/bin"
_append-path "/sbin"
_append-path "/opt/X11/bin"
_prepend-path "$HOMEBREW_PREFIX/bin"
_prepend-path "$HOMEBREW_PREFIX/sbin"
_prepend-path "$HOME/.local/share/mise/shims"

current_ruby=$(mise ls ruby -c --json | jq --raw-output '.[0].version')
export GEM_HOME="$INSTALL_DIR/ruby/$current_ruby/gems"
export GEM_INSTALL="$GEM_HOME"
_prepend-path "$GEM_HOME/gems/bin"

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
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=~/Library/Fonts"
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_DUMP_DESCRIBE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export GPG_TTY=$(tty)
export WORDCHARS='*?[]~$^()}<>'
export ZSH_COMPDUMP=$XDG_CONFIG_HOME/zsh-compdump
