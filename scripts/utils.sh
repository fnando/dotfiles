# Set window title
title() {
  echo -ne "\033]0;$@\007";
}

# reload source
reload() {
  source ~/.bash_profile;
}

# list directory after cd; also save the last directory
# and open it when a new tab is created.
cd() {
  builtin cd "${@:-$HOME}" && ls && pwd > $CDHISTORY;

  # if [ -f .rvmrc ]; then
  #   __rvm_project_rvmrc
  # fi
}

# run rake without worring about
# bundler wrapper.
function rake {
  if [ -e Gemfile ]; then
    bundle exec rake $@
  else
    `which rake` $@
  fi
}

if [ -f $CDHISTORY ]; then
  dir=$(cat $CDHISTORY)

  if [ -d "$dir" ]; then
    cd "$dir" && clear
  fi
fi

# Open a new SSH tunnel.
#
#   $ tunnel                    # Open dynamic proxy for my own domain
#   $ tunnel example.com 2812   # Redirect localhost:2812 to example.com:2812, without exposing service/port.
#   $ tunnel -h                 # Show help
#
tunnel() {
  if [[ $# = 0 ]]; then
    echo "Opening dynamic tunnel to simplesideias..."
    sudo ssh -vND localhost:666 fnando@simplesideias.com.br
  elif [[ $# = 2 ]]; then
    echo "Forwarding port $2 to $1..."
    ssh -L $2:localhost:$2 $1
  else
    echo "Usage:"
    echo "  tunnel                         # Use simplesideias as proxy server"
    echo "  tunnel example.com 2345        # Redirect port from localhost:2345 to example.com"
    echo ""
    echo "Common ports:"
    echo "  2812: Monit"
    echo "  5984: CouchDB"
  fi
}

# Check if given url is giving gzipped content
#
#   $ gzipped http://simplesideias.com.br
#
gzipped() {
  local r=`curl -L --write-out "%{size_download}" --output /dev/null --silent $1`
  local g=`curl -L -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}" --output /dev/null --silent $1`
  local message

  local rs=`expr ${r} / 1024`
  local gs=`expr ${g} / 1024`

  if [[ "$r" =  "$g" ]]; then
    message="Regular: ${rs}KB\n\033[31m → Gzip: ${gs}KB\033[0m"
  else
    message="Regular: ${rs}KB\n\033[32m → Gzip: ${gs}KB\033[0m"
  fi

  echo -e $message
  return 0
}

# Schedule alarm. Will display growl
# notification and beep.
#
#   $ alarm "now + 2 hours" "Your time has finished"
#
# Quotes required, sorry!
#
alarm() {
  echo "afplay /System/Library/Sounds/Basso.aiff && /usr/local/bin/growlnotify -t Alarm -s -d alarm -a /Applications/iCal.app -m '$2'" | at $1
}
