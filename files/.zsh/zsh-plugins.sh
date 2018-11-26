for plugin in $(ls ~/.zsh-plugins); do
  plugin_file="$HOME/.zsh-plugins/$plugin/$plugin.zsh"
  source "$plugin_file"
done

# General plugin configuration
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"
