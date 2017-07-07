#fpath=($DOTFILES_DIR/zsh/zsh-completions/src/ $fpath)

autoload -U compinit; compinit

setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt list_packed
setopt list_types
setopt noautoremoveslash
setopt magic_equal_subst
setopt print_eight_bit
setopt complete_aliases

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors ${LS_COLORS}

zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:sudo:*' command-path \
    /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
