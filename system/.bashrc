# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve DOTFILES_PATH (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_PATH=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_PATH="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi


# Make utilities available
PATH="$DOTFILES_PATH/bin:$PATH"

# source the alias file
. "$DOTFILES_PATH"/system/.alias

# source the custom bash prompt
. "$DOTFILES_PATH"/system/prompt.sh

# set ls colors
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export DOTFILES_PATH
