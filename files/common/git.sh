author_name=$(git config --get user.name)
author_email=$(git config --get user.email)
author_signingkey=$(git config --get user.signingkey)

if [[ "$author_name" = "" ]]; then
  (echo Please configure ~/.${SHELL_NAME}/user.sh with your git info.) > /dev/stderr
fi

if [[ "$(git config --global --get user.name)" != "$GIT_AUTHOR_NAME" ]]; then
  git config --global user.name "$GIT_AUTHOR_NAME"
  git config --global user.email "$GIT_AUTHOR_EMAIL"
fi

if [[ "$GIT_AUTHOR_SIGNING_KEY" != "" ]]; then
  git config --global user.signingkey "$GIT_SIGNING_KEY"
fi

if [[ "$GIT_DIFF_HIGHLIGHT" != "" ]]; then
  git config --global core.pager "$GIT_DIFF_HIGHLIGHT | less"
fi

unset GIT_DIFF_HIGHLIGHT
unset GIT_AUTHOR_NAME
unset GIT_AUTHOR_EMAIL
unset GIT_AUTHOR_SIGNING_KEY
