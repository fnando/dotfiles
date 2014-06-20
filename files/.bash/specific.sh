export HISTFILE="$HOME/.bash_history"
alias reload="source ~/.bash_profile"

for option in autocd cdspell cmdhist dotglob extglob dirspell globstar histappend nocaseglob no_empty_cmd_completion checkwinsize direxpand; do
  shopt -s $option &> /dev/null
done

# Try to load homebrew's config.
# Then try to load Linux config.
# Load the vendored script otherwise.
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
