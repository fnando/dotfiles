for repo in $(cat ~/.config/default-zsh-plugins); do
  plugin=$(basename $repo)
  plugin_dir=$HOME/.config/zsh-plugins/$plugin
  plugin_file="/$plugin.zsh"

  if [[ -f "$plugin_dir/$plugin.zsh" ]]; then
    source "$plugin_dir/$plugin.zsh"
  elif [[ -f "$plugin_dir/$plugin.plugin.zsh" ]]; then
    source "$plugin_dir/$plugin.plugin.zsh"
  fi
done

# General plugin configuration
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"
