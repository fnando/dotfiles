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

_zsh_autosuggest_strategy_histdb_top_here() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where places.dir LIKE '$(sql_escape $PWD)%'
and commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv order by count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_here
