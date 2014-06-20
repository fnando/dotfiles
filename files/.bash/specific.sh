export HISTFILE="$HOME/.bash_history"

for option in autocd cdspell cmdhist dotglob extblog dirspell globstar histappend nocaseglob no_empty_cmd_completion checkwinsize; do
  tmp="$(shopt -q "$option" 2>&1 > /dev/null | grep "invalid shell option name")"
  if [ '' == "$tmp" ]; then
    shopt -s "$option"
  fi
done

# Try to load homebrew's config.
# Then try to load Linux config.
# Load the vendored script otherwise.
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
else
  . "${HOME}/.bash/bash_completion.sh"
fi
