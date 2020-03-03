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

  tmux bind-key -t vi-copy v begin-selection
  tmux bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

  tmux unbind -t vi-copy Enter
  tmux bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

  tmux bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
fi
