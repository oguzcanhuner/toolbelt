export TERM="xterm-256color"
if [ -f ~/.aliases ]; then . ~/.aliases ; fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

git_commit_time () {
  g=$(git rev-parse --is-inside-work-tree 2>/dev/null) || return
  time=$(git log --format="%cr" -n 1 )
  sed "s/\([0-9]*\) \([ywdhms]\).*/\|\1\2/"<<< "$time"
}

git_color() {
  g=$(git rev-parse --is-inside-work-tree 2>/dev/null) || return
  # Count number of lines in git status (no changes, no lines)
  a="$(git status --short | wc -l)"
  b=0

 # Set the terminal color to orange or green, depending on status (green: no
 # changes, orange: uncomitted changes)
 if (( "$a" > "$b" ))
 then
   tput setaf 94 #orange
 else
   tput setaf 42 #green
 fi
}

function prompt {
  local BLUE="\[\033[0;34m\]"
  local DARK_BLUE="\[\033[1;34m\]"
  local NO_COLOR="\[\033[0m\]"
  local GREEN="\[\033[0;32m\]"
  local BROWN="\[\033[1;31m\]"
  local PURPLE="\[\033[0;35m\]"

  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
  PS1="$DARK_BLUE\w$PURPLE\$(git_branch)$DARK_BLUE-> $NO_COLOR"
  PS2='continue-> '
}
prompt
export AUTOFEATURE=true


# redis env variables for nitrous io
export REDIS_CLOUD_HOST=pub-redis-14156.eu-west-1-1.2.ec2.garantiadata.com
export REDIS_CLOUD_PORT=14156

source ~/git-completion.bash
source ~/.nvm/nvm.sh
