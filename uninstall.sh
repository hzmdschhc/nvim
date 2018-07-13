#!/bin/bash
if [ -e "vimrc.bak" ]; then
    echo "recovery from vimrc.bak"
    mv vimrc.bak ~/.vimrc
else
    echo "You have NOT install this vimrc"
    echo "Run ./install.sh to install this vimrc"
fi

