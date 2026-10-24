# Register command completions after Sheldon initializes compinit.
if (( $+commands[chezmoi] && $+functions[compdef] )); then
  eval "$(chezmoi completion zsh)"
fi

if (( $+commands[mise] && $+functions[compdef] )); then
  eval "$(mise completion zsh)"
fi
