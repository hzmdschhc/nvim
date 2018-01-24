#!/bin/bash
dire="oldvimrc"
if [ -d "$dire" ]; then
    rm -r "$dire"
    mkdir "$dire"
else
    mkdir "$dire"
fi
cp ~/.vimrc oldvimrc
cp .vimrc ~/

