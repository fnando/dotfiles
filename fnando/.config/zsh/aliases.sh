alias pcat="pygmentize -f terminal256 -O style=tango -g"
alias hex="openssl rand -hex"
alias path='print -l $path'
alias subl="subl -n"
alias beep='echo -e "\a"'
alias grep="grep --color=auto"
alias clippy="cargo clippy -- -Dwarnings -Dclippy::all -Dclippy::pedantic"
alias reload="source ~/.zshrc"
alias pcat="bat"
alias simple-prompt="zsh -f -c 'export PS1=$'\''\n$ '\''; exec zsh -f'"
alias claude-work="CLAUDE_CONFIG_DIR=~/.config/claude-work claude"

cargo-build-watch() {
  while true; do
    find . -not \( -path "*/.git/*" -o -path "*/target/*" -o -path "*/node_modules/*" \) | entr sh -c "clear && cargo build && hud -t 'Done' -m 'Task has finished' --symbol-name 'checkmark.circle'"
  done
}
