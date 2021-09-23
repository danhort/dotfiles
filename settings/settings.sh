#!/usr/bin/env bash

if [[ $OSTYPE != 'darwin'* ]]; then
    # increase max file watch
    echo "-- Increasing file watches --"
    sudo sed -i '/fs.inotify.max_user_watches/d' /etc/sysctl.conf
    sudo bash -c "echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf"
    sudo sysctl -p
fi

# Add vs code settings
echo "-- Adding vs code settings --"
mkdir -p ~/.config/Code/User
ln -svf ~/.dotfiles/settings/vscode/settings.json ~/.config/Code/User

# Add Git configs
echo "-- Adding Git Configs --"
ln -svf .dotfiles/settings/.gitconfig ~

# Add Editor configs
echo "-- Adding Editor Configs --"
ln -svf .dotfiles/settings/.editorconfig ~