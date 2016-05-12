# BEGIN DOTFILES TEMPLATE CODE
if [ -f ~/.dotfiles.conf  ]; then
	. ~/.dotfiles.conf
fi
for f in `find %DOTFILES_ROOT%/zsh/zshenv.d -type f`; do . $f; done
# END DOTFILES TEMPLATE CODE
