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
    read -p "rebuild? [y/N] "
    if [ "$REPLY" == "y" ]
    then
        echo "rebuilding nix"
        sudo nixos-rebuild switch
        echo "done"
    fi
    exit 0
else
    echo "$REPLY is not a valid directory"
    exit 1
fi
