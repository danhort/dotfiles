#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_PATH
DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make utilities available
chmod -R u+x $DOTFILES_PATH/bin
PATH="$DOTFILES_PATH/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_PATH/.git"; then
  git --work-tree="$DOTFILES_PATH" --git-dir="$DOTFILES_PATH/.git" pull origin master;
fi

# Bunch of symlinks
echo "-- Creating Symllinks --"
rm ~/.dotfiles
ln -sv $DOTFILES_PATH ~/.dotfiles

# install software
./software/install.sh

# update system files
./system/system.sh

# update system settings
./settings/settings.sh