#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import getpass
import shutil

vimrc_path = '/home/{user}/.vimrc'.format(user=getpass.getuser())

if os.path.exists(vimrc_path):
    print('file:', vimrc_path, 'has existsed')
    print('Back up it to vimrc/vimrc.bak')
    shutil.copyfile(vimrc_path, './vimrc.bak')
else:
    print('file:', vimrc_path, 'has NOT existsed')
    print('create a new .vimrc in ~')

shutil.copyfile('./vimrc', vimrc_path)
print('done')

colors_path = '/home/{user}/.vim/colors'.format(user=getpass.getuser())
if not os.path.exists(colors_path):
    print('creating %s' % colors_path)
    os.makedirs(colors_path)

print('coping some color.vim to %s' % colors_path)
for filename in os.listdir('./colors'):
    shutil.copy('./colors/'+filename, colors_path)

print('done')

