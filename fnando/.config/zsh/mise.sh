# https://mise.jdx.dev/
if ! (( ${+commands[mise]} )); then
  return
fi

eval "$(mise activate zsh --shims)"

# The generated completion file calls `compdef`, which only exists after
# compinit has run. init.sh runs compinit later (so that plugin fpath entries
# are picked up), so we defer completion sourcing to the first precmd — by
# then compinit has run and compdef is defined.
_mise_load_completions() {
  local cache=~/.cache/zsh/mise.zsh
  if [[ ! -f $cache || ${commands[mise]} -nt $cache ]]; then
    mkdir -p ~/.cache/zsh
    mise completion zsh > $cache
  fi
  source $cache
  add-zsh-hook -d precmd _mise_load_completions
  unset -f _mise_load_completions
}
add-zsh-hook precmd _mise_load_completions
