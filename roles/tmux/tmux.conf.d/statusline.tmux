tmux set-option -g status-bg "colour238"
tmux set-option -g status-fg "colour255"

tmux set-option -g status-left "#[fg=colour255,bg=colour241] #S #[default] "
tmux set-option -g status-right "#[fg=colour255,bg=colour241] #H #[default] #[fg=colour255,bg=colour241] %Y/%m/%d %H:%M:%S #[default]"

tmux set-window-option -g window-status-format " #I: #W "
tmux set-window-option -g window-status-current-format "#[fg=colour255,bg=colour57,bold] #I: #W #[default]"
