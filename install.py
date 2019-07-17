#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import getpass
import shutil

# Vundle
def vundle_install(target_path):
    if  os.path.exists(vundle_path):
        print('Vundle: already installed')
    else:
        print('Vundle: Installing...')
        os.system('git clone https://github.com/VundleVim/Vundle.vim.git'
            + ' ~/.vim/bundle/Vundle.vim')

    print('Vundle: Plugin installing...')
    os.system('vim +PluginInstall +qall')
    print('Vundle: Plugin install done')
    print('Vundle: done\n')

# vimrc
def vimrc_install(target_path, src_path):
    if os.path.exists(target_path):
        print('vimrc:', vimrc_path, 'Found')
        print('vimrc: Back it up to ./src/vimrc.bak')
        shutil.copyfile(target_path, './src/vimrc.bak')

    shutil.copyfile(src_path, target_path)
    print('vimrc: done\n')

def ctags_install():
    pass


if __name__ == '__main__':
    user = getpass.getuser()
    vimrc_path = F'/home/{user}/.vimrc'
    vimrc_src_path = './src/vimrc'
    vundle_path = F'/home/{user}/.vim/bundle/Vundle.vim'

    vimrc_install(vimrc_path, vimrc_src_path)
    vundle_install(vundle_path)
    
    print('Enjoy!')

