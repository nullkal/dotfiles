
# emulate GNU readlink's "readlink -f" behavior on Mac
# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
function readlink_f {
    TARGET_FILE=$1

    while [ "$TARGET_FILE" != "" ]; do
        cd `dirname $TARGET_FILE`
        FILENAME=`basename $TARGET_FILE`
        TARGET_FILE=`readlink $FILENAME`
    done

    echo `pwd -P`/$FILENAME
}

export DOTFILES_DIR=$(dirname $(readlink_f ~/.zshenv))/..
for file in $DOTFILES_DIR/zsh/zshenv.d/**/*.zsh(N); do
    source $file
done

[ -f ~/.zshenv.local ] && source ~/.zshenv.local
