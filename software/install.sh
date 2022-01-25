#!/usr/bin/env bash

echo "-- Installing Software --"

# Add docker ce repository https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Add vscode
curl -fsSL https://code.visualstudio.com/docs/?dv=linux64_deb | sudo apt-key add -
sudo add-apt-repository -y \
    "[arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main"

# Add github cli repository https://github.com/cli/cli/blob/trunk/docs/install_linux.md
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null


sudo apt update
sudo apt install -y \
    docker-compose \
    gitk \
    slack-desktop \
    awscli \
    htop \
    timewarrior \
    docker-ce \
    code \
    gh \
    pv

sudo groupadd docker
sudo usermod -aG docker $USER

# Add Joplin note app https://joplinapp.org/
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash