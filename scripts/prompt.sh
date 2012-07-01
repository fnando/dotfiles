__hellobits_prompt () {
  history -a
  history -c
  history -r

  local BLUE="\[\033[0;34m\]"
  local NO_COLOR="\[\e[0m\]"
  local GRAY="\[\033[1;30m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local RED="\[\033[0;31m\]"
  local WHITE="\[\033[1;37m\]"
  local YELLOW="\[\033[0;33m\]"

  local BASE_COLOR="$NO_COLOR"
  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=`git status 2> /dev/null | grep "On branch" | sed 's/# On branch //'`
  fi

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=" $BRANCH"
  fi

  local RUBY_VERSION=`ruby -e "puts RUBY_VERSION"`

  if [ -f Gemfile.lock ]; then
    local RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  local RUBY_PROMPT=""
  local STATUS=`git status 2>/dev/null`
  local PROMPT_COLOR=""
  local STATE=" "
  local NOTHING_TO_COMMIT="# Initial commit"
  local BEHIND="# Your branch is behind"
  local AHEAD="# Your branch is ahead"
  local UNTRACKED="# Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="# Changed but not updated"
  local TO_BE_COMMITED="# Changes to be committed"
  local CHANGES_NOT_STAGED="# Changes not staged for commit"
  local LOG=`git log -1 2> /dev/null`

  if [[ "$RAILS_VERSION" ]]; then
    local RAILS_PROMPT="${RAILS_VERSION}#"
  fi

  RUBY_PROMPT="${GRAY}[${RAILS_PROMPT}${RUBY_VERSION}]${NO_COLOR} "

  if [ "$STATUS" != "" ]; then
    if [[ "$STATUS" =~ "$CHANGES_NOT_STAGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$NOTHING_TO_COMMIT" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    else
      PROMPT_COLOR="${GREEN}"
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE="${STATE}${YELLOW}*${NO_COLOR}"
    fi

    PS1="\n${RUBY_PROMPT}${BASE_COLOR}\w\a${NO_COLOR} ${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}${NO_COLOR}\n\$ "
  else
    PS1="\n${RUBY_PROMPT}${BASE_COLOR}\w\a${NO_COLOR}\n\$ "
  fi
}

PROMPT_COMMAND=__hellobits_prompt
