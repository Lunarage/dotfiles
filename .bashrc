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

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#Local settings
if [[ -f $HOME/.bashrc-local ]]
then
    source ~/.bashrc-local
fi

