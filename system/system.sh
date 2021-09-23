#!/usr/bin/env bash

# Add system files symlinks
echo "-- Adding system files --"

ln -svf .dotfiles/system/.bashrc ~

if [[ $OSTYPE == 'darwin20' ]]; then
	ln -svf .dotfiles/system/.bash_profile ~
fi