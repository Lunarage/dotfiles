#
# ~/.bash_profile
#

if [[ -d $HOME/dotfiles ]]
then
    OUTPUT=$(cd ~/dotfiles && git status -s)
    COUNT=$(echo "$OUTPUT" | wc -l)
    cd
    if [ "$COUNT" != "0" ]
    then
        echo "Changes to dotfiles:"
        echo "$OUTPUT"
    fi
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
