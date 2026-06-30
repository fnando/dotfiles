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

export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"
_prepend-path "$CARGO_HOME/bin"
export CDHISTORY="/tmp/cd-$USER"
export CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY=1
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
export CLAUDE_CODE_ENABLE_TELEMETRY=0
export CLAUDE_CONFIG_DIR=~/.config/claude
export COCOAPODS_DISABLE_STATS=true
export COPILOT_TELEMETRY_ENABLED=false
export DISABLE_TELEMETRY=1
export DO_NOT_TRACK=1
export DOCKER_CLI_HINTS=false
export DOCKER_TELEMETRY=false
export FASTLANE_OPT_OUT_USAGE=YES
export GH_TELEMETRY=false
export GOTELEMETRY=off
export GPG_TTY=$(tty)
export HOMEBREW_BUNDLE_DUMP_DESCRIBE=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_NO_LOCK=1
export HOMEBREW_CACHE="/tmp/homebrew-cache"
export HOMEBREW_CASK_OPTS="--appdir=/Applications --fontdir=~/Library/Fonts"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export LESS="-REX"
export LESS_TERMCAP_mb=$'\E[04;33m'
export LESS_TERMCAP_md=$'\E[04;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'
export NEXT_TELEMETRY_DISABLED=1
export npm_config_cache=/tmp/npm-cache
export PAGER="less"
export STRIPE_CLI_TELEMETRY_OPTOUT=1
export WORDCHARS='*?[]~$^()}<>'
export YARN_CACHE_FOLDER=/tmp/yarn-cache
export YARN_ENABLE_TELEMETRY=0
export ZSH_COMPDUMP=$XDG_CONFIG_HOME/zsh-compdump

export COLIMA_HOME="$HOME/.local/share/colima"
export LIMA_HOME=$HOME/.local/share/colima-lima

export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
