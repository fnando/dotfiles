__hellobits_prompt () {
  blue="\033[0;34m"
  no_color="\e[0m"
  gray="\033[1;30m"
  green="\033[0;32m"
  light_gray="\033[0;37m"
  light_green="\033[1;32m"
  light_red="\033[1;31m"
  red="\033[0;31m"
  white="\033[1;37m"
  yellow="\033[0;33m"

  base_color="$no_color"
  branch=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  home=$(echo $HOME | sed 's/\//\\\//g')
  cwd=`pwd | sed "s/$home\//~\//"`

  if [[ "$branch" = "" ]]; then
    branch=`git status 2> /dev/null | grep "On branch" | sed -E 's/^.*On branch //'`
  fi

  if [[ "$branch" = "" ]]; then
    branch=" $branch"
  fi

  ruby_version=`ruby -e "puts RUBY_VERSION"`

  if [ -f Gemfile.lock ]; then
    rails_version=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  ruby_prompt=""
  git_status=`git status 2> /dev/null | tr "\\n" " "`
  prompt_color=""
  state=" "
  nothing_to_commit="# Initial commit"
  behind="Your branch is behind"
  ahead="Your branch is ahead"
  untracked="Untracked files"
  diverged="have diverged"
  changed="Changed but not updated"
  to_be_commited="Changes to be committed"
  changes_not_staged="Changes not staged for commit"
  log=`git log -1 2> /dev/null`

  if [[ "$rails_version" != "" ]]; then
    rails_prompt="${rails_version}#"
  fi

  ruby_prompt="${no_color}[${USER}|${rails_prompt}${ruby_version}]${no_color} "

  if [ "$git_status" != "" ]; then
    if [[ "$git_status" =~ "$changes_not_staged" ]]; then
      prompt_color="${red}"
      state=""
    elif [[ "$git_status" =~ "$nothing_to_commit" ]]; then
      prompt_color="${red}"
      state=""
    elif [[ "$git_status" =~ "$diverged" ]]; then
      prompt_color="${red}"
      state="${state}${red}↕${no_color}"
    elif [[ "$git_status" =~ "$behind" ]]; then
      prompt_color="${red}"
      state="${state}${red}↓${no_color}"
    elif [[ "$git_status" =~ "$ahead" ]]; then
      prompt_color="${red}"
      state="${state}${red}↑${no_color}"
    elif [[ "$git_status" =~ "$changed" ]]; then
      prompt_color="${red}"
      state=""
    elif [[ "$git_status" =~ "$to_be_commited" ]]; then
      prompt_color="${red}"
      state=""
    else
      prompt_color="${green}"
      state=""
    fi

    if [[ "$git_status" =~ "$untracked" ]]; then
      state="${state}${yellow}*${no_color}"
    fi

    echo "\n${ruby_prompt}${base_color}${cwd}${no_color} ${prompt_color}${branch}${no_color}${state}${no_color}\n\$ "
  else
    echo "\n${ruby_prompt}${base_color}${cwd}${no_color}\n\$ "
  fi
}

PROMPT='$(__hellobits_prompt)'
