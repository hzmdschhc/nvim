" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


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

" Requirements
Plug 'roxma/nvim-yarp'

" 自动补全
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-jedi'
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect
endif

" Initialize plugin system
call plug#end()


" colortheme
colorscheme gruvbox
set background=dark

" 支持python3
if has('nvim')
    let g:python3_host_prog = "/home/chao/anaconda3/bin/python3"
endif

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
    if &filetype == 'python'
        call setline(1, "#!/usr/bin/env python3")
        call setline(2, "#-*- coding: utf-8 -*-")
        call append(line("$"), "# **************************************")
        call append(line("$"), "# Author        :   huangchao")
        call append(line("$"), "# Created Time  :   ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line("$"), "# **************************************")
        call append(line("$"), "")
    elseif &filetype == 'sh'
        call setline(1, "#!/bin/bash")
        call append(line("$"), "# **************************************")
        call append(line("$"), "# Author        :   huangchao")
        call append(line("$"), "# Created Time  :   ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line("$"), "# **************************************")
        call append(line("$"), "")
    endif
endfunc

autocmd BufNewFile * call SetHeader()
autocmd BufNewFile * normal G

" 窗口切换快捷键
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" -ctags setting -
set tags=tags
set tags+=./tags

set pastetoggle=<F2>

map <F5> :call Run()<CR>
imap <F5> <ESC>:call Run()<CR>
vmap <F5> <ESC>:call Run()<CR>

" Quickly Run
func! Run()
	exec "w"
	if &filetype == 'python'
		exec "!python3 %"
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

