# https://mise.jdx.dev/
eval "$(mise activate zsh --shims)"

zsh_completions_dir=$XDG_CONFIG_HOME/zsh-completions
mise_completions=$zsh_completions_dir/mise

if [[ ! -d "$mise_completions" ]]; then
  mkdir -p $zsh_completions_dir
  mise completion zsh > $mise_completions
fi

source $mise_completions
