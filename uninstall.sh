#!/bin/bash
if [ -e "vimrc.old" ]; then
    echo "recovery from vimrc.old"
    cp vimrc.old ~/.vimrc
else
    echo "You have NOT install this vimrc"
    echo "Run ./install.sh to install this vimrc"
fi

