if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" colortheme
Plug 'morhetz/gruvbox'

" 文件导航栏
Plug 'preservim/nerdtree'

" 括号引号自动配对
Plug 'jiangmiao/auto-pairs'

" 状态栏
Plug 'vim-airline/vim-airline'

" 注释
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1

" 多点编辑
Plug 'terryma/vim-multiple-cursors'

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Chiel92/vim-autoformat'

call plug#end()

colorscheme gruvbox

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf-8
set wrap
syntax on
set nu
set relativenumber
set cursorline
set showcmd
set wildmenu

" 距离底部或顶部还有5行时滚动
set scrolloff=5

"search
set hlsearch
exec 'nohlsearch'
set incsearch
set ignorecase
set smartcase

func! SetHeader()
    let header = []
    if &filetype == 'python'
        call add(header, "-*- coding=utf-8 -*-")
        call add(header, "")

    elseif &filetype == 'sh'
        call add(header, "#!/bin/bash")
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
		exec "!python -u %"
    elseif &filetype == 'sh'
        :!bash %
	endif
endfunc

map s <nop>
map S :w<CR>
map Q :q<CR>
map QQ :q!<CR>
map R :source $MYVIMRC<CR>
noremap <F3> :Autoformat<CR>

" 分屏
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

" 修改分屏窗口大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>

" tab
map te :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnext<CR>
map tq :tabclose<CR>

