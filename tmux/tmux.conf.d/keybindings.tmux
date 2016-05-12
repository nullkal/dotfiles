# Change the prefix key to C-z
tmux unbind C-b
tmux set -g prefix C-z

# Send prefix (C-z C-z)
tmux bind C-z send-prefix
