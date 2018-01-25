" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set smartindent
set fileformat=unix

set encoding=utf-8
syntax on
set nu

map <F5> :call Run()<CR>
imap <F5> <ESC>:call Run()<CR>
vmap <F5> <ESC>:call Run()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Run()
	exec "w"
	if &filetype == 'python'
		exec "!time python3 %"
	elseif &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'sh'
        :!time bash %
	endif
endfunc

