" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif


" colortheme
Plug 'morhetz/gruvbox'

" 文件导航栏
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <C-m> :NERDTreeToggle<CR>

" 括号引号自动配对
Plug 'jiangmiao/auto-pairs'

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'

" 注释
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

" 多点编辑
Plug 'terryma/vim-multiple-cursors'

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>

" Initialize plugin system
call plug#end()


" colortheme
colorscheme gruvbox
set background=dark

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set fileformat=unix
set encoding=utf-8
syntax on
set nu

" 距离底部或顶部还有5行时滚动
set scrolloff=5

" 查找时不高亮
set nohlsearch

" 搜索忽略大小写
" set ignorecase

if &filetype == 'cpp'
    set cindent
endif

func! SetHeader()
    let header = []
    if &filetype == 'python'
        call add(header, "#!/usr/bin/env python3")
        call add(header, "# -*- coding: utf-8 -*-")
        call add(header, "")

    elseif &filetype == 'sh'
        call add(header, "#!/bin/bash")
        call add(header, "")
    endif

    call append(0, header)
endfunc

autocmd BufNewFile * call SetHeader()
autocmd BufNewFile * normal G

" 窗口切换快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -ctags setting -
set tags=tags;

set pastetoggle=<F2>

map <F5> :call Run()<CR>
imap <F5> <ESC>:call Run()<CR>
vmap <F5> <ESC>:call Run()<CR>

" Quickly Run
func! Run()
	exec "w"
	if &filetype == 'python'
		exec "!python %"
	elseif &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!./%<"
    elseif &filetype == 'cpp'
        exec '!g++ -Wall -std=c++11 %'
        exec '!./a.out'
        exec '!rm a.out'
    elseif &filetype == 'sh'
        :!bash %
    elseif &filetype == 'matlab'
        exec "!octave-cli %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %:r"
	endif
endfunc

