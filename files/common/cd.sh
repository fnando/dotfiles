cd() {
  builtin cd "${@:-$HOME}" && pwd > $CDHISTORY;
}

if [ -f $CDHISTORY ]; then
   dir=$(cat $CDHISTORY)

   if [ -d "$dir" ]; then
    cd "$dir"
   fi
fi
