#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import getpass
import shutil

# Vundle
def vundle_install():
    user = getpass.getuser()
    target_path = F'/home/{user}/.vim/bundle/Vundle.vim'

    if  os.path.exists(target_path):
        print('Vundle: already installed')
    else:
        print('Vundle: Installing...')
        os.system('git clone https://github.com/VundleVim/Vundle.vim.git'
            + ' ~/.vim/bundle/Vundle.vim')

    print('Vundle: Plugin installing...')
    os.system('vim +PluginInstall +qall')
    print('Vundle: Plugin install done')
    print('Vundle: done\n')

# vim-plug
def vim_plug_install():
    user = getpass.getuser()
    target_path = F'/home/{user}/.vim/autoload/plug.vim'

    if  os.path.exists(target_path):
        print('vim-plug: already installed')
    else:
        print('vim-plug: Installing...')
        os.system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

    os.system('vim +PlugInstall +qall')
    print('vim-plug: done\n')

# vimrc
def vimrc_install():
    user = getpass.getuser()
    target_path = F'/home/{user}/.vimrc'
    src_path = './src/vimrc'

    if os.path.exists(target_path):
        print('vimrc:', 'already exists')
        print('vimrc: Back it up to ./src/vimrc.bak')
        shutil.copyfile(target_path, './src/vimrc.bak')

    shutil.copyfile(src_path, target_path)
    print('vimrc: done\n')

def ctags_install():
    pass


if __name__ == '__main__':
    vimrc_install()
    vim_plug_install()
    
    print('Enjoy!')

