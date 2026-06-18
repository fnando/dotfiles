# https://mise.jdx.dev/
eval "$(mise activate zsh --shims)"

mise_completions=~/.cache/zsh/mise.zsh

if [[ ! -f "$mise_completions" ]]; then
  mise completion zsh > $mise_completions
fi

source $mise_completions
