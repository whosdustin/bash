# COLOR LIST VARIABLES
RED="\033[1;31m"
ORANGE="\033[1;33m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
BLACK="\033[1;30m"
BOLD="\033[1;1m"
RESET="\033[m"

# BACKGROUND COLORS
BKRED="\e[41m"
BKGREEN="\e[42m"
BKORANGE="\e[43m"
BKBLUE="\e[44m"
BKPURPLE="\e[45m"
BKWHITE="\e[47m"
BKBLACK="\e[40m"
BKRESET="\e[m"

parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1 $(check_for_repo) /"
}

check_for_repo () {
  status=$(git status 2>/dev/null | tail -n 1)
  if [[ $status == "nothing to commit, working tree clean" ]]
  then
    echo "✔︎"
  else
    echo "✘"
  fi
}

set_bash_prompt () {
  stat=$(git status 2>/dev/null | tail -n 1)
  if [[ $stat == "nothing to commit, working tree clean" ]]
  then
    GITCOLOR=$GREEN
    GITBKG=$BKGREEN
    GITTEXT=$BLACK
  else
    GITCOLOR=$RED
    GITBKG=$BKRED
    GITTEXT=$ORANGE
  fi
  PS1=" \[$PURPLE\]\w\[$RESET\]\[$GITCOLOR\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" ( \")\$(parse_git_branch)\[$RESET\]\[$GITCOLOR\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \") \")\[$RESET\]\n \[$ORANGE\]⚡ \[$RESET\]"
}

PROMPT_COMMAND=set_bash_prompt
