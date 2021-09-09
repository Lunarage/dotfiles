#
# ~/.bash_profile
#

if [[ -d $HOME/dotfiles ]]
then
    OUTPUT=$(cd ~/dotfiles && git status -s)
    cd
    if echo "$OUTPUT" | wc -l > 0
    then
        echo "Changes to dotfiles:"
        echo "$OUTPUT"
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
