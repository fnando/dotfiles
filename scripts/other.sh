# Activate RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Activate NVM
[[ -f $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh
nvm use v0.4.7 &> /tmp/nvm.log
