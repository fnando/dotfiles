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

# Only autocd when the $CDHISTORY file cannot be found.
if [ ! -f $CDHISTORY ]; then
  if [ -d $HOME/Projects ]; then
    cd $HOME/Projects
  fi
fi
