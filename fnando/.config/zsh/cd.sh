cd() {
  builtin cd "${@:-$HOME}" && pwd > $CDHISTORY;
}

popd() {
  builtin popd && pwd > $CDHISTORY;
}

pushd() {
  builtin pushd && pwd > $CDHISTORY;
}

if [ -f $CDHISTORY ]; then
   dir=$(cat $CDHISTORY)

   if [ -d "$dir" ]; then
    cd "$dir"
   fi
fi

if [ ! -f $CDHISTORY ]; then              # Only autocd when the $CDHISTORY file
  if [ -d /Projects ]; then               # cannot be found. In this case, try
    cd /Projects                          # to find the /Projects directory,
  elif [ -d /vagrant ]; then              # defaulting to the vagrant directory.
    cd /vagrant
  fi
fi
