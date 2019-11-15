#!/usr/bin/env python3
#-*- coding: utf-8 -*-
# **************************************
# Author        :   huangchao
# Created Time  :   2019-07-22 22:09:41
# **************************************

import os
import getpass
import shutil

USER = getpass.getuser()

# install neovim
os.system('curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage')
os.system('chmod u+x nvim.appimage')
install_dir = F'/home/{USER}/.local/bin/'
yes_or_no = input(F'install neovim on {install_dir} [yN]:')
if yes_or_no.lower() == 'n':
    install_dir = input('input your installation absolute path:')
install_dir = os.path.normpath(install_dir)
if not os.path.exists(install_dir):
    os.mkdir(install_dir)
install_path = os.path.join(install_dir, 'nvim')
shutil.move('nvim.appimage', install_path)
print(F'copy nvim.appimage to {install_path}')

# copy init.vim
obj_dir = F'/home/{USER}/.config/nvim'
obj_dir = os.path.normpath(obj_dir)
if not os.path.exists(obj_dir):
    os.mkdir(obj_dir)
shutil.copy('init.vim', obj_dir)
print(F'copy init.vim to {obj_dir}')

# install vim-plug
os.system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

# install plug
os.system('nvim +PlugInstall +qall')

print('Enjoy!')
