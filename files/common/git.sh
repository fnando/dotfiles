author_name=${GIT_AUTHOR_NAME:-`git config --get user.name`}
author_email=${GIT_AUTHOR_EMAIL:-`git config --get user.email`}
author_signingkey=${GIT_AUTHOR_SIGNING_KEY:-`git config --get user.signingkey`}
git_diff_command="$GIT_DIFF_HIGHLIGHT | less"

if [[ "$author_name" = "" ]]; then
  (echo Please configure ~/.${SHELL_NAME}/user.sh with your git info.) > /dev/stderr
fi

if [[ "$(git config --global user.name)" != "$author_name" ]]; then
  git config --global user.name "$author_name"
fi

if [[ "$(git config --global user.email)" != "$author_email" ]]; then
  git config --global user.email "$author_email"
fi

if [[ "$(git config --global user.signingkey)" != "$author_signingkey" ]]; then
  git config --global user.signingkey "$author_signingkey"
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
fi

if [[ "$(git config --global core.pager)" != "$git_diff_command" ]]; then
  git config --global core.pager "$git_diff_command"
fi

unset GIT_DIFF_HIGHLIGHT
unset GIT_AUTHOR_NAME
unset GIT_AUTHOR_EMAIL
unset GIT_AUTHOR_SIGNING_KEY
