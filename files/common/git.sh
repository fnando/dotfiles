if [[ "$GIT_AUTHOR_NAME" = "" ]]; then
  (echo Please configure ~/.${SHELL_NAME}/user.sh with your git info.) > /dev/stderr
fi

if [[ "$(git config --get user.name)" != "$GIT_AUTHOR_NAME" ]]; then
  git config --global user.name "$GIT_AUTHOR_NAME"
  git config --global user.email "$GIT_AUTHOR_EMAIL"
fi
