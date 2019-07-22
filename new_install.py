#!/usr/bin/env python3
#-*- coding: utf-8 -*-
# **************************************
# Author        :   huangchao
# Created Time  :   2019-07-22 22:09:41
# **************************************

import os
import getpass
import shutil
import time

class MyVimrcInstaller:

    def __init__(self, vimrc_path):

        self.vimrc_path = vimrc_path

        def analysis(fpath):
            assert os.path.isfile(fpath), ("no such file: "
                    F"{fpath}")

            if fpath.endswith('init.vim'):
                return 'neovim'
            else:
                return 'vim'

        self.vim_type = analysis(self.vimrc_path)
        
        user = getpass.getuser()
        if self.vim_type == 'neovim':
            self.target_path = (F'/home/{user}/.config/nvim/'
                    'init.vim')
        else:
            self.target_path = F'/home/{user}/.vimrc'

    def _copy_vimrc(self):
        if os.path.exists(self.target_path):
            now = time.strftime("%Y%m%d_%H%M%S")
            back_path = F"{self.target_path}.bak_{now}"
            print(F"vimrc: already exists: {self.target_path}")
            print(F"vimrc: Back it up to {back_path}")
            shutil.move(self.target_path, back_path)

        shutil.copyfile(self.vimrc_path, self.target_path)
        print('vimrc: done\n')

    def _insatll_plug(self):
        pass

    def install(self):
        pass

    def uninstall(self):
        pass


if __name__ == '__main__':
    installer = MyVimrcInstaller('src/init.vim')
    installer._copy_vimrc()

