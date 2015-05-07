autoload -U colors; colors

if [[ -z $PROMPT_COLOR ]]; then
    export PROMPT_COLOR="yellow"
fi
PC="${fg[$PROMPT_COLOR]}"

PROMPT="%{$PC%}[%n@%m %c]%#%{${reset_color}%} "
PROMPT2="%{$PC%}%B%_>%b%{${reset_color}%} "
SPROMPT="%{$PC%}%r is correct? [n, y, a, e]:%{${reset_color}%} "
RPROMPT="%{$PC%}[%{${fg[red]}%}%*%{$PC%}]%{${reset_color}%}"

setopt transient_rprompt
