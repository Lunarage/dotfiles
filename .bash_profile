#
# ~/.bash_profile
#

if [[ -d $HOME/dotfiles ]]
then
    cd ~/dotfiles
    COUNT=$(git status -s | wc -l)
    if [ "$COUNT" != "0" ]
    then
        echo "Changes to dotfiles:"
        git status -s
    fi
    cd
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
