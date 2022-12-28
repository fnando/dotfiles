export PATH="$HOME/local/bin:$PATH"

if [[ ! -f ~/.op ]]; then
  op run -- true
  op-env > ~/.op
  chmod 600 ~/.op
fi

if [[ -f ~/.op ]]; then
  source ~/.op
fi
