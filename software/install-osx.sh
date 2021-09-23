#!/usr/bin/env bash

echo "-- Installing Software --"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew insatll -v \
    wget \
    awscli \
    pv \
    docker-compose
    
brew install --cask -v \
    docker \
    visual-studio-code