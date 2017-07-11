# Change the prefix key to C-z
tmux unbind C-b
tmux set -g prefix C-z

tmux set -g status-keys emacs
tmux setw -g mode-keys emacs

# Send prefix (C-z C-z)
tmux bind C-z send-prefix

tmux bind-key v split-window -h
tmux bind-key s split-window -v

# Pane moving
tmux bind-key h select-pane -L
tmux bind-key j select-pane -D
tmux bind-key k select-pane -U
tmux bind-key l select-pane -R
