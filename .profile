# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# Screenshot: http://img.gf3.ca/d54942f474256ec26a49893681c49b5a.png
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 256)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
      WHITE=$(tput setaf 7)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

# parse_git_dirty () {
#   [[ $(git status 2> /dev/null | grep "nothing to commit") != "nothing to commit, working tree clean" ]] && echo " 💩 "
# }
# parse_git_clean () {
#   [[ $(git status 2> /dev/null | grep "nothing to commit") == "nothing to commit, working tree clean" ]] && echo " 👍 "
# }
# parse_git_branch () {
#   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
# }

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function git-dirty {
  st=$(git status 2>/dev/null | tail -n 1)
  if [[ $st != "nothing to commit, working tree clean" ]]
  then
      echo " 💩 "
  fi
}
function check_for_repo {
  status=$(git status 2>/dev/null | tail -n 1)
  if [[ $status == "" ]]
  then
      echo ""
  else
      echo $(git-dirty)
  fi
}

PS1="${BOLD}${PURPLE}=> \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" [ \")\[$PURPLE\]\$(parse_git_branch)\$(check_for_repo)\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" ] \")\[$WHITE\]\n⚡️  \[$RESET\]"

# Document List Colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
