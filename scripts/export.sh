export PATH="./bin:$HOME/local/bin:$HOME/local/sbin:$HOME/local/ruby/gems/bin:$HOME/Sites/codeplane/scripts:$HOME/bin:$HOME/.bash/bin:$HOME/local/flex4/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export INSTALL_DIR="$HOME/local"
export CLASSPATH="/usr/local/rhino:$CLASSPATH"
export EVENT_NOKQUEUE=1
export MANPATH=/usr/local/git/man:$MANPATH
export EDITOR="$HOME/bin/mate -w"
export SVN_EDITOR="/usr/bin/mate -w"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=1000000
export HISTIGNORE="&"
export HISTSIZE=${HISTFILESIZE}
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CDPATH=.:~:~/Sites:~/Sites/github
export CDHISTORY="/tmp/cd-${USER}"

export RUBYLIB='.'
export RUBYOPT=''
export GEM_HOME="$HOME/local/ruby/gems"
export GEM_PATH="$HOME/local/ruby/gems"

export LESS_TERMCAP_mb=$'\E[04;33m'
export LESS_TERMCAP_md=$'\E[04;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

export EC2_HOME="$HOME/.ec2"
export EC2_PRIVATE_KEY="$EC2_HOME/pk.pem"
export EC2_CERT="$EC2_HOME/cert.pem"
export EC2_AMI_HOME="$EC2_HOME/ec2-ami-tools"
export PATH="$EC2_HOME/bin:$EC2_AMI_HOME/bin:$PATH"
export JAVA_HOME="/Library/Java/Home"

export BLUE="\[\033[0;34m\]"
export NO_COLOR="\[\e[0m\]"
export GRAY="\[\033[1;30m\]"
export GREEN="\[\033[0;32m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export LIGHT_RED="\[\033[1;31m\]"
export RED="\[\033[0;31m\]"
export WHITE="\[\033[1;37m\]"
export YELLOW="\[\033[0;33m\]"

# Reset
export Color_Off='\e[0m'       # Text Reset

# Regular Colors
export Black='\e[0;30m'        # Black
export Red='\e[0;31m'          # Red
export Green='\e[0;32m'        # Green
export Yellow='\e[0;33m'       # Yellow
export Blue='\e[0;34m'         # Blue
export Purple='\e[0;35m'       # Purple
export Cyan='\e[0;36m'         # Cyan
export White='\e[0;37m'        # White

# Bold
export BBlack='\e[1;30m'       # Black
export BRed='\e[1;31m'         # Red
export BGreen='\e[1;32m'       # Green
export BYellow='\e[1;33m'      # Yellow
export BBlue='\e[1;34m'        # Blue
export BPurple='\e[1;35m'      # Purple
export BCyan='\e[1;36m'        # Cyan
export BWhite='\e[1;37m'       # White

# Underline
export UBlack='\e[4;30m'       # Black
export URed='\e[4;31m'         # Red
export UGreen='\e[4;32m'       # Green
export UYellow='\e[4;33m'      # Yellow
export UBlue='\e[4;34m'        # Blue
export UPurple='\e[4;35m'      # Purple
export UCyan='\e[4;36m'        # Cyan
export UWhite='\e[4;37m'       # White

# Background
export On_Black='\e[40m'       # Black
export On_Red='\e[41m'         # Red
export On_Green='\e[42m'       # Green
export On_Yellow='\e[43m'      # Yellow
export On_Blue='\e[44m'        # Blue
export On_Purple='\e[45m'      # Purple
export On_Cyan='\e[46m'        # Cyan
export On_White='\e[47m'       # White

# High Intensty
export IBlack='\e[0;90m'       # Black
export IRed='\e[0;91m'         # Red
export IGreen='\e[0;92m'       # Green
export IYellow='\e[0;93m'      # Yellow
export IBlue='\e[0;94m'        # Blue
export IPurple='\e[0;95m'      # Purple
export ICyan='\e[0;96m'        # Cyan
export IWhite='\e[0;97m'       # White

# Bold High Intensty
export BIBlack='\e[1;90m'      # Black
export BIRed='\e[1;91m'        # Red
export BIGreen='\e[1;92m'      # Green
export BIYellow='\e[1;93m'     # Yellow
export BIBlue='\e[1;94m'       # Blue
export BIPurple='\e[1;95m'     # Purple
export BICyan='\e[1;96m'       # Cyan
export BIWhite='\e[1;97m'      # White

# High Intensty backgrounds
export On_IBlack='\e[0;100m'   # Black
export On_IRed='\e[31m'        # Red
export On_IGreen='\e[32m'      # Green
export On_IYellow='\e[0;103m'  # Yellow
export On_IBlue='\e[0;104m'    # Blue
export On_IPurple='\e[10;95m'  # Purple
export On_ICyan='\e[0;106m'    # Cyan
