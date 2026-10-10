author_name=$GIT_AUTHOR_NAME
author_email=$GIT_AUTHOR_EMAIL
author_signingkey=$GIT_AUTHOR_SIGNING_KEY
git_diff_command="$GIT_DIFF_HIGHLIGHT | less"

if [[ -z "$author_name" ]]; then
  print -u2 "Please configure ~/.${SHELL_NAME}/user.sh with your git info."
fi

# Apply git global config once per unique input set.
# The sentinel stores a fingerprint of the inputs; if it matches, skip the
# ~6 `git config` forks that would otherwise run every shell startup.
sentinel=$XDG_CACHE_HOME/git-config.fingerprint
fingerprint="$author_name|$author_email|$author_signingkey|$GIT_DIFF_HIGHLIGHT|$USING_ONE_PASSWORD"

if [[ ! -f $sentinel || "$(<$sentinel)" != "$fingerprint" ]]; then
  [[ -n "$author_name" ]]        && git config --global user.name "$author_name"
  [[ -n "$author_email" ]]       && git config --global user.email "$author_email"
  [[ -n "$author_signingkey" ]]  && {
    git config --global user.signingkey "$author_signingkey"
    git config --global commit.gpgsign true
    git config --global gpg.format ssh
    if [[ "$USING_ONE_PASSWORD" = "true" ]]; then
      git config --global --add gpg.ssh.program /Applications/1Password.app/Contents/MacOS/op-ssh-sign
    fi
  }
  [[ -x "$GIT_DIFF_HIGHLIGHT" ]] && git config --global core.pager "$git_diff_command"

  mkdir -p $XDG_CACHE_HOME
  print -r -- "$fingerprint" > $sentinel
fi

unset sentinel fingerprint author_name author_email author_signingkey git_diff_command
unset GIT_DIFF_HIGHLIGHT GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_AUTHOR_SIGNING_KEY
