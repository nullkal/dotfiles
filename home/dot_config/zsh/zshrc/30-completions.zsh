# Register command completions after Sheldon initializes compinit.
if (( $+commands[chezmoi] && $+functions[compdef] )); then
  eval "$(chezmoi completion zsh)"
fi
