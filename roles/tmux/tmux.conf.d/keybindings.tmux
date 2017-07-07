# Change the prefix key to C-z
tmux unbind C-b
tmux set -g prefix C-z

tmux set -g status-keys emacs
tmux setw -g mode-keys emacs

# Send prefix (C-z C-z)
tmux bind C-z send-prefix
