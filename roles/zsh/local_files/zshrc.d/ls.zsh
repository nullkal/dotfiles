# Set the same color scheme to get the same appearance
export LSCOLORS="Exfxcxdxbxegedabagacad"
export LS_COLORS="di=1;34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

if [ -n "$LS_TYPE_GNULS" ]; then
    alias ls='ls --color=auto'
fi

if [ -n "$LS_TYPE_BSDLS" ]; then
    alias ls='ls -G'
fi