#!/bin/sh
read -p "what should be copied? "
test -d $REPLY
if [ $? == 0 ]
then
    set -e
    echo "copying from $REPLY"
    cd $REPLY
    sudo cp -r * /etc/nixos/
    cd - > /dev/null
    echo "done"
    exit 0
else
    echo "$REPLY does not exist."
    exit 1
fi
