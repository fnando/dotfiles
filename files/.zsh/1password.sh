export PATH="$HOME/local/bin:$PATH"
export USING_ONE_PASSWORD="true"

if [[ ! -f ~/.op ]]; then
  op run -- true
  op-env > ~/.op
  chmod 600 ~/.op
fi

if [[ -f ~/.op ]]; then
  source ~/.op
fi
