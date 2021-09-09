#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Add aliases from external file
source ~/.aliases

#Tweak history
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Promt-variables
USERNAME='\u'
HOST='\h'
WORKINGDIR='\w'
TITLE='\[]0;\h\a\]'
BOLD='\[\e[1m\]'

BLACK='\[\e[1;30m\]'
RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
MAGENTA='\[\e[1;35m\]'
CYAN='\[\e[1;36m\]'
LIGHTGRAY='\[\e[1;37m\]'
DARKGRAY='\[\e[1;90m\]'
LIGHTRED='\[\e[1;91m\]'
LIGHTGREEN='\[\e[1;92m\]'
LIGHTYELLOW='\[\e[1;93m\]'
LIGHTBLUE='\[\e[1;94m\]'
LIGHTMAGENTA='\[\e[1;95m\]'
LIGHTCYAN='\[\e[1;96m\]'
WHITE='\[\e[1;97m\]'

RESET='\[\e[0;39m\]'

# Functions for git in promt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_modified() {
    git status -s 2> /dev/null | wc -l | sed -e 's/[1-9]\+/(M)/' -e 's/0//'
}

# Default promt
export PS1="\e${TITLE}${USERNAME}@${HOST}:${WORKINGDIR}\$"

#Local settings
if [[ -f $HOME/.bashrc-local ]]
then
    source ~/.bashrc-local
fi

# Add git branch and status to end of promt
export PS1="${PS1}\[${BOLD}${LIGHTYELLOW}\]\$(parse_git_branch)\[${RED}\]\$(parse_git_modified)\[${RESET}\]\n"

