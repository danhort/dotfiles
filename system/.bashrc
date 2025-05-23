# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Make utilities available
PATH="~/.dotfiles/bin:$PATH"

# source the alias file
if [ -f ~/.dotfiles/local/.alias ]; then
    . ~/.dotfiles/system/.alias
fi

# source the custom bash prompt
. ~/.dotfiles/system/prompt.sh

# set ls colors
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'

# Export
export DOTFILES_PATH

# source local bashrc
if [ -f ~/.dotfiles/local/.bashrc ]; then
    . ~/.dotfiles/local/.bashrc
fi