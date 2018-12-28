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

# install software
./software/install.sh

# Bunch of symlinks
ln -svf $DOTFILES_PATH ~/.dotfiles
ln -svf .dotfiles/system/.bashrc ~
ln -svf .dotfiles/git/.gitconfig ~
ln -svf .dotfiles/system/.editorconfig ~
mkdir -p .config/Code/User
ln -svf ~/.dotfiles/settings/vscode/settings.json ~/.config/Code/User