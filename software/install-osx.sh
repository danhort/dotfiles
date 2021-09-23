#!/usr/bin/env bash

echo "-- Installing Software --"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew insatll weget -v
brew install --cask docker -v
brew install --cask visual-studio-code -v
brew install --cask docker -v
brew install docker-composex -v
brew install awscli -v