let g:mapleader=" "
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
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

colorscheme gruvbox

" coc extentions
let g:coc_global_extensions = [
            \ 'coc-vimlsp',
            \ 'coc-json',
            \ 'coc-python',
            \ 'coc-marketplace']

" coc config
set hidden
set updatetime=100
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

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
        call add(header, "# -*- coding=utf-8 -*-")
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

