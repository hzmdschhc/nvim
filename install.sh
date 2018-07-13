#!/bin/bash
if [ -e "/home/$USER/.vimrc" ]; then
    echo ".vimrc has existsed in ~"
    echo "copy .vimrc to ./vimrc/vimrc.bak"
    mv ~/.vimrc ./vimrc.bak
else
    echo ".vimrc has NOT existsed in ~"
    echo "copy a new .vimrc to ~"
fi
cp vimrc ~/.vimrc
echo "done"

