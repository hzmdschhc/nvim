#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import getpass
import shutil

# Vundle
def vundle_install(target_path):
    if  os.path.exists(vundle_path):
        print('Vundle: Found')
    else:
        print('Vundle: Not found')
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
        print('vimrc: Back up it to vimrc/vimrc.bak')
        if not os.path.exists('./backup'):
            print('vimrc: directory backup/ Not found')
            print('vimrc: creating backup/')
            os.mkdir('./backup')
        shutil.copyfile(target_path, './backup/vimrc.bak')
    else:
        print('vimrc:', target_path, 'Not found')
        print('vimrc: create a new .vimrc in ~')
    shutil.copyfile(src_path, target_path)
    print('vimrc: done\n')

# directory colors
def colors_install(target_path, src_path):
    if not os.path.exists(target_path):
        print('colors:', target_path, 'Not found')
        print('colors: creating %s' % target_path)
        os.makedirs(target_path)
    else:
        print('colors: Found')
    print('colors: coping some color.vim to %s' % target_path)
    if src_path[-1] != '/':
        src_path += '/'
    for filename in os.listdir(src_path):
        shutil.copy(src_path + filename, target_path)
    print('colors: done\n')

# remove vundle code in vimrc
def remove_vundle(vimrc_path, flag):
    with open(vimrc_path, 'r+') as f:
        data = f.read()
        idx = data.find(flag)
        if idx != -1:
            print("remove vundle: flag '%s' Found" % flag)
            # 去掉前面的vundle配置代码，+2是去掉FLAG后的两个回车
            no_vundle = data[idx + len(FLAG)+2:]
            f.seek(0) # 清空之前一定要先定位
            f.truncate() # 清空文件
            f.write(no_vundle)
            print('remove Vundle: done')
        else:
            print("remove vundle: flag '%s' Not found" % flag)

def ctags_install():
    pass


if __name__ == '__main__':
    vimrc_path = '/home/{user}/.vimrc'.format(user=getpass.getuser())
    vimrc_src_path = './src/vimrc'

    colors_path = '/home/{user}/.vim/colors'.format(user=getpass.getuser())
    colors_src_path = './colors'

    vundle_path = '/home/{user}/.vim/bundle/Vundle.vim'.format(
            user=getpass.getuser()
        )

    FLAG = '@Vundle end$'

    vimrc_install(vimrc_path, vimrc_src_path)
    colors_install(colors_path, colors_src_path)
    yes_or_no = input('Do you want to install Vundle? [Y/N]: ')
    if len(yes_or_no) > 0 and yes_or_no.lower()[0] == 'n':
        remove_vundle(vimrc_path, FLAG)
    else:
        vundle_install(vundle_path)
    
    print('Enjoy!')

