author_name=${GIT_AUTHOR_NAME:-`git config --get user.name`}
author_email=${GIT_AUTHOR_EMAIL:-`git config --get user.email`}
author_signingkey=${GIT_AUTHOR_SIGNING_KEY:-`git config --get user.signingkey`}

if [[ "$author_name" = "" ]]; then
  (echo Please configure ~/.${SHELL_NAME}/user.sh with your git info.) > /dev/stderr
fi

git config --global user.name "$author_name"
git config --global user.email "$author_email"
git config --global user.signingkey "$author_signingkey"

if [[ "$GIT_DIFF_HIGHLIGHT" != "" ]]; then
  git config --global core.pager "$GIT_DIFF_HIGHLIGHT | less"
fi

unset GIT_DIFF_HIGHLIGHT
unset GIT_AUTHOR_NAME
unset GIT_AUTHOR_EMAIL
unset GIT_AUTHOR_SIGNING_KEY
