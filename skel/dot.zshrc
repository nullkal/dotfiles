for file in $DOTFILES_DIR/zsh/zshrc.d/**/*.zsh(N); do
    source $file
done

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
