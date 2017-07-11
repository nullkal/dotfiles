# 256 colors terminal
tmux set -g default-terminal "screen-256color"

# Enable mouse
tmux set -g mouse on

# The measure for https://github.com/neovim/neovim/wiki/FAQ#esc-in-tmux-or-gnu-screen-is-delayed
tmux set -g escape-time 10

tmux set -g base-index 1

# Clipboad sharing in Mac OS X
if [ `uname` = "Darwin" ]; then
    tmux set -g default-command "reattach-to-user-namespace -l zsh"
fi
