#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make utilities available
chmod -R u+x $DOTFILES_DIR/bin
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
  git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master;
fi

# install software
./software/install.sh

# Bunch of symlinks
ln -svf "$DOTFILES_DIR/system/.bashrc" ~
ln -svf "$DOTFILES_DIR/git/.gitconfig" ~
ln -svf "$DOTFILES_DIR/system/.editorconfig" ~
