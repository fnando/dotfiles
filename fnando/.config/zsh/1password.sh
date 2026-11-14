export USING_ONE_PASSWORD="true"

# When connecting to the machine remotely, skip 1password's SSH agent socket,
# otherwise it'll request touchid authorization.
#
# This assumes the connecting machine is forwarding the SSH agent socket, which
# is the default on `fnando/.ssh/config`.
if [ -z "$SSH_CONNECTION" ]; then
  export SSH_AUTH_SOCK=$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
else
  export GIT_CONFIG_COUNT=1
  export GIT_CONFIG_KEY_0=gpg.ssh.program
  export GIT_CONFIG_VALUE_0=ssh-keygen
fi

op_env=$XDG_CONFIG_HOME/op-env

if [[ ! -f $op_env ]]; then
  op run -- true
  op-env export > $op_env
  chmod 600 $op_env
fi

_source-file-if-exists $op_env
