export USING_ONE_PASSWORD="true"
export SSH_AUTH_SOCK=$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

op_env=$XDG_CONFIG_HOME/op-env

if [[ ! -f $op_env ]]; then
  op run -- true
  op-env > $op_env
  chmod 600 $op_env
fi

_source-file-if-exists $op_env
