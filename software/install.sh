#!/usr/bin/env bash
sudo apt update
sudo apt install -y \
    make \
    docker-compose \
    gitk \
    nodejs \
    npm \
    yarn \
    ruby \
    rbenv \
    curl \
    mysql-workbench \
    vagrant \
    virtualbox \
    gnome-tweak-tool \
    htop

# Install docker ce https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install -y docker-ce
sudo usermod -aG docker $USER
