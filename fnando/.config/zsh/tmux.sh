# Allow SSH ForwardAgent on tmux
if [[ -n "$TMUX" ]]; then
  SOCK="/tmp/ssh-agent-$USER-screen"

  if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]; then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
  fi
fi
