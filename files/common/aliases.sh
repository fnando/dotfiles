alias pcat="pygmentize -f terminal256 -O style=tango -g"
alias hex="openssl rand -hex"
alias path='echo $PATH | tr : "\n" | uniq'
alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"
alias subl="subl -n"
alias beep='echo -e "\a"'
alias grep="grep --color=auto"
alias clippy="cargo clippy -- -Dwarnings -Dclippy::all -Dclippy::pedantic"
