" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 括号引号自动配对
Plug 'jiangmiao/auto-pairs'

" colortheme
Plug 'morhetz/gruvbox'


" Initialize plugin system
call plug#end()

" setting: Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>


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
set laststatus=2
set scrolloff=3

" 80字符线
set cc=80

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

" 自动在行首插入注释符号
" 支持python和sh，即在行首插入#
" 可用shift+v,选中多行，批量注释
map <F2> :call Annotation()<CR>

func! Annotation()
    let allow = 0
    if &filetype == 'python' || &filetype == 'sh'
        let sep='#'
        let allow = 1
    endif

    if allow
        if getline(".")[0] == sep
            exec ".s/" . sep . " /"
        else
            exec ".s/^/" . sep . " "
        endif
    endif
endfunc

set pastetoggle=<F3>

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