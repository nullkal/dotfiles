
# Checking what type of "ls" command this environment has
if ls --color -d . >/dev/null 2>&1; then
    GNU_LS=1
elif ls -G -d . >/dev/null 2>&1; then
    BSD_LS=1
fi

if [[ $GNU_LS == 1 ]]; then
    alias ls="ls -F --color=auto"
fi

if [[ $BSD_LS == 1 ]]; then
    alias ls="ls -FG"
fi

# Set the same color scheme to get the same appearance
export LSCOLORS="Exfxcxdxbxegedabagacad"
export LS_COLORS="di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
