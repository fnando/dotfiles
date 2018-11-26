if [[ -x "heroku" ]]; then
  heroku() {
    unset -f heroku
    command heroku autocomplete
    eval "$(heroku autocomplete:script zsh)"
  }
fi
