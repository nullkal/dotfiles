# 256 colors terminal
tmux set -g default-terminal "screen-256color"

# Enable mouse
tmux set-option -g mouse on

# Clipboad sharing in Mac OS X
if [ `uname` = "Darwin" ]; then
    tmux set-option -g default-command "reattach-to-user-namespace -l zsh"
fi
