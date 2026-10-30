# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Make utilities available
PATH="~/.dotfiles/bin:$PATH"

# source the alias file
if [ -f ~/.dotfiles/local/.alias ]; then
    . ~/.dotfiles/system/.alias
fi

# source the custom bash prompt
. ~/.dotfiles/system/prompt.sh

# set ls colors
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'

# Export
export DOTFILES_PATH

# source local bashrc
if [ -f ~/.dotfiles/local/.bashrc ]; then
    . ~/.dotfiles/local/.bashrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
