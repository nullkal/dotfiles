# 256 colors terminal
tmux set -g default-terminal "screen-256color"

# Enable mouse
tmux setw -g mode-mouse on
tmux set  -g mouse-select-pane on
tmux set  -g mouse-resize-pane on
tmux set  -g mouse-select-window on

# Clipboad sharing in Mac OS X
if [ `uname` = "Darwin" ]; then
    tmux set-option -g default-command "reattach-to-user-namespace -l zsh"
fi
