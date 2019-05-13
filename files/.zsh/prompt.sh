fg_blue="\033[0;34m"
fg_reset="\e[0m"
fg_gray="\033[1;30m"
fg_green="\033[0;32m"
fg_light_gray="\033[0;37m"
fg_light_green="\033[1;32m"
fg_light_red="\033[1;31m"
fg_red="\033[0;31m"
fg_white="\033[1;37m"
fg_yellow="\033[0;33m"

__fnando_git_branch () {
  branch=$(git branch 2> /dev/null | grep \* | sed 's/* //')

  if [[ "$branch" = "" ]]; then
    branch=$(git status 2> /dev/null | grep "On branch" | sed -E 's/^.*On branch //')
  fi

  branch=$(echo $branch | sed -E 's/[)(]//g')

  echo $branch
}

__fnando_git_status () {
  nothing_to_commit="# Initial commit"
  behind="Your branch is behind"
  ahead="Your branch is ahead"
  untracked="Untracked files"
  diverged="have diverged"
  changed="Changed but not updated"
  to_be_commited="Changes to be committed"
  changes_not_staged="Changes not staged for commit"

  git_branch=$(__fnando_git_branch)
  git_status=$(git status 2> /dev/null | tr "\\n" " ")

  if [[ "$git_branch" = "" ]]; then
    return
  fi

  if [[ "$git_status" =~ "$changes_not_staged" ]]; then
    prompt_color="${fg_red}"
    state=""
  elif [[ "$git_status" =~ "$nothing_to_commit" ]]; then
    prompt_color="${fg_red}"
    state=""
  elif [[ "$git_status" =~ "$diverged" ]]; then
    prompt_color="${fg_red}"
    state="${state}${fg_red}↕${fg_reset}"
  elif [[ "$git_status" =~ "$behind" ]]; then
    prompt_color="${fg_red}"
    state="${state}${fg_red}↓${fg_reset}"
  elif [[ "$git_status" =~ "$ahead" ]]; then
    prompt_color="${fg_red}"
    state="${state}${fg_red}↑${fg_reset}"
  elif [[ "$git_status" =~ "$changed" ]]; then
    prompt_color="${fg_red}"
    state=""
  elif [[ "$git_status" =~ "$to_be_commited" ]]; then
    prompt_color="${fg_red}"
    state=""
  else
    prompt_color="${fg_green}"
    state=""
  fi

  if [[ "$git_status" =~ "$untracked" ]]; then
    state="${state}${fg_red}*${fg_reset}"
  fi

  echo "${fg_yellow}\uf7a1${fg_reset} ${prompt_color}${git_branch}${fg_reset}${state}"
}

__fnando_ruby () {
  if [ -f Gemfile.lock ]; then
    ruby_version=$(ruby -e "puts RUBY_VERSION")
    echo "${fg_red}\ue23e ${ruby_version}${fg_reset}"
  fi
}

__fnando_rails () {
  if [ -f Gemfile.lock ]; then
    rails_version=$(cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/')
    [ "$rails_version" != "" ] && echo " ${fg_red}\ue73b ${rails_version}${fg_reset}"
  fi
}

__fnando_node () {
  if [ -f package.json  ] && [ -x "$(which node)" ]; then
    node_version=$(node -v | sed -E 's/v//')
    echo "${fg_green}\uf898  ${node_version}${fg_reset}"
  fi
}

__fnando_react () {
  for manifest in yarn.lock package-lock.json package.json; do
    if [ -f "$manifest" ]; then
      break
    fi
  done

  if [ -f "$manifest" ]; then
    name_hex=$(pwd | md5)
    content_hex=$(cat "$manifest" | md5)
    cache_file="/tmp/react-${name_hex}-${content_hex}"
    pkg_manifest="node_modules/react/package.json"

    if [ -f "$cache_file" ]; then
      react_version=$(cat "$cache_file")
    else
      if [ -f "$pkg_manifest" ]; then
        react_version=$(cat "$pkg_manifest" | jq '.version' | sed -E 's/[^0-9.]//g')
      else
        react_version=$(npm ls react 2> /dev/null | grep react@ | sed -E 's/[^0-9.]//g')
      fi

      echo -n "$react_version" | head -n1 > "$cache_file"
    fi

    [ "$react_version" != "" ] && echo " ${fg_blue}\ue7ba ${react_version}${fg_reset}"
  fi
}

__fnando_blocks () {
  blocks="$(__fnando_ruby)$(__fnando_rails)$(__fnando_node)$(__fnando_react)"
  blocks=$(echo $blocks | sed -E 's/^ +//')

  if [[ "$blocks" != "" ]]; then
    blocks="${blocks} "
  fi

  echo $blocks
}

__fnando_path () {
  current_path="${PWD/#$HOME/~}"
  echo "in ${fg_blue}${current_path}${fg_reset}"
}

__fnando_prompt() {
  prompt="\n$(__fnando_path) $(__fnando_git_status) $(__fnando_blocks)\n$ "
  echo $prompt
}

PROMPT='$(__fnando_prompt)'
