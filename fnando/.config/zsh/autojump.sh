autojump_dir=$(brew --prefix --installed autojump 2> /dev/null)

if [[ "$autojump_dir" != "" ]]; then
  source $autojump_dir/share/autojump/autojump.zsh
fi
