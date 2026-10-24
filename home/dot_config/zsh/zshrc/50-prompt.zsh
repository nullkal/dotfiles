# Preserve Zsh's normal/root prompt character for Starship.
export STARSHIP_PROMPT_SYMBOL="${(%):-%#}"
eval "$(starship init zsh)"
PROMPT2='%F{yellow}%B%_>%b%f '
SPROMPT='%F{yellow}%r is correct? [n, y, a, e]:%f '
setopt transient_rprompt
