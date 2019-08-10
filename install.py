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

# copy init.vim
obj_dir = F'/home/{USER}/.config/nvim'
if not os.path.exists(obj_dir):
    os.mkdir(obj_dir)
shutil.copy('init.vim', obj_dir)

# install vim-plug
os.system('curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')

# install plug
os.system('nvim +PlugInstall +qall')

print('Enjoy!')

