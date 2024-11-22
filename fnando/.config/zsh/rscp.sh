function rscp() {
  rsync -vr --partial --progress -e ssh $1 $2
}
