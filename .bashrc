#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Add aliases from external file
source ~/.aliases

#Set up environment
export SDL_AUDIODRIVER=alsa
export EDITOR=vim
export LANGUAGE="en_US"
export BROWSER="chromium"
export PAGER="less"

#Add colorfull command prompt
PS1='\e]0;\h\a\e[1;34m\]\u@\e[m\]\[\e[1;31m\]\h \w\$\[\e[m\] \n'

#Tweak history
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Set default filepermissions for new files to rwxrw-r-x
umask 0012
