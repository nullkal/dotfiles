HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_verify

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "OA" history-beginning-search-backward-end
bindkey "OB" history-beginning-search-forward-end
bindkey "[A" history-beginning-search-backward-end
bindkey "[B" history-beginning-search-forward-end

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

function history-all { history -E 1 }
