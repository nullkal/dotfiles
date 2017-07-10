#!/bin/sh

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install softwares
brew install ctags git neovim nvm python3 rbenv reattach-to-user-namespace tmux zsh

# Write ~/.zshrc
cat <<'ZSHRC' > ~/.zshrc
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

ZSHRC

/opt/local/bin/zsh <<ZSHELL
rbenv install 2.4.1
rbenv global 2.4.1
nvm install --lts
pip3 install neovim
ZSHELL
