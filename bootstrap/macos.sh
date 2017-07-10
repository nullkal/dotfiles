#!/bin/sh

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install softwares
brew install rbenv nvm tmux reattach-to-user-namespace zsh git neovim

# Write ~/.zshrc
cat <<'ZSHRC' > ~/.zshrc
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

ZSHRC
