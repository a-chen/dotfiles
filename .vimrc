" inspirations: https://dougblack.io/words/a-good-vimrc.html

syntax enable           " enable syntax processing

set backspace=indent,eol,start
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set autoindent

" UI Config 
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command men
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" Leader shortcuts
let mapleader=" "       " leader is space
" jk is escape
inoremap jk <esc>

" save session
nnoremap <leader>s :mksession<CR>

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
