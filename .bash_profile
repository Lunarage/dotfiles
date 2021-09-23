#
# ~/.bash_profile
#

if [[ -d $HOME/dotfiles ]]
then
    CWD=$(pwd)
    cd ~/dotfiles
    COUNT=$(git status -s | wc -l)
    if [ "$COUNT" != "0" ]
    then
        echo "Changes to dotfiles:"
        git status -s
    fi
    cd $CWD
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
