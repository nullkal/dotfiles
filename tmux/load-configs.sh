#!/bin/sh

# emulate GNU readlink's "readlink -f" behavior on Mac
# http://stackoverflow.com/questions/1055671/how-can-i-get-the-behavior-of-gnus-readlink-f-on-a-mac
readlink_f() {
    TARGET_FILE=$1

    while [ "$TARGET_FILE" != "" ]; do
        cd `dirname $TARGET_FILE`
        FILENAME=`basename $TARGET_FILE`
        TARGET_FILE=`readlink $FILENAME`
    done

    echo `pwd -P`/$FILENAME
}

for file in $(dirname $(readlink_f $0))/tmux.conf.d/*.tmux; do
    . $file
done
