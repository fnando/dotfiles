source-file-if-exists "$HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source-file-if-exists "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source-file-if-exists "$HOMEBREW_PREFIX/share/zsh-you-should-use/you-should-use.plugin.zsh"

for repo in $(cat ~/.config/default-zsh-plugins); do
  plugin=$(basename $repo)
  plugin_dir=$HOME/.config/zsh-plugins/$plugin
  plugin_file="/$plugin.zsh"

  source-file-if-exists "$plugin_dir/$plugin.zsh"
  source-file-if-exists "$plugin_dir/$plugin.plugin.zsh"
done

# General plugin configuration
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white"
