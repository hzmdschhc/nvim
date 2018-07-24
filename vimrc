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
set pastetoggle=<F3>
syntax on
" set nu

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
        exec '!g++ % -o %<'
        exec '!./%<'
    elseif &filetype == 'sh'
        :!bash %
    elseif &filetype == 'matlab'
        exec "!octave-cli %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %:r"
	endif
endfunc

func! Assign_script()
    if &filetype == 'python'
        call append(0, "#!/usr/bin/env python3")
        call append(1, "# -*- coding: utf-8 -*-")
    endif
endfunc

map <F4> :call Assign_script()<CR>

