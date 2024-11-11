"version 6.0
set nocompatible " be iMproved, required

" Load the colorscheme from the appropriate directory
" In general, everything in ~/.vim has priority.
if !filereadable(expand("~/.vim/colors/paps.vim"))
	set runtimepath+=${HOME}/dotfiles/.vim/
endif

set fileencodings=ucs-bom,utf-8,default,latin1
set  helplang=en
"set noloadplugins
" vim: set ft=vim :

set title
set ttyfast

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
"set novisualbell
set t_vb=

set t_Co=256 " using 256 colors

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Use Unix as the standard file type
set fileformats=unix,mac,dos

set ambiwidth=double

" When formatting text, recognize numbered lists
set formatoptions+=n

filetype on
filetype plugin on
filetype plugin indent on

set autoindent " Auto indent
set smartindent " Smart indent

" 1 tab == 4 spaces
set tabstop=8
set softtabstop=8
set shiftwidth=8

" Uncomment if identation should be immediately applied in the opened file
"set smarttab

" Uncomment to use spaces instead of tabs
"set expandtab 
set noexpandtab

set wrap " Wrap lines

" Enable syntax highlighting
syntax enable

" Always show current position
set ruler

" Show line number by default
set number
set relativenumber

" Turn on the Wild menu
set wildmenu
set wildmode=list:longest,full
" Ignore compiled files
set wildignore=*.so,*.swp,*.pyc,*.pyo,*.o,*.7z

set virtualedit=block

set sessionoptions-=options " Don't restore all options and mappings

set completeopt=menu,preview,longest
set pumheight=10

set updatetime=1000

set history=100 " command line history

" Swap files are necessary when crash recovery
if !isdirectory($HOME . "/.vim/swapfiles") | call mkdir($HOME . "/.vim/swapfiles", "p") | endif
set dir=$HOME/.vim/swapfiles//

" Turn persistent undo on, means that you can undo even when you close a buffer/VIM
set undofile
set undolevels=1000

if !isdirectory($HOME. "/.vim/undotree") | call mkdir($HOME . "/.vim/undotree", "p") | endif
set undodir=$HOME/.vim/undotree//

" For regular expressions turn magic on
set magic

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases, meaning that if we use any upper
" case letter in search, then it will care about case
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers, meaning find patterns while
" searching.
set incsearch

" Disable highlight when <Backspace> is pressed
nnoremap <silent> <BS> :nohlsearch<CR>

" Always show status line
set laststatus=2
set statusline=%<%n\ %F\ " filename
set statusline+=%m%r%w%h " option
set statusline+=\ [%{&ff}]/%y " fileformat/filetype
set statusline+=%=%(%l/%L,%c\ %)\%p%% " Right aligned file nav info

set showcmd

" Show matching brackets when text indicator is over them
set showmatch

"for assembly 
let asmsyntax = "asm68k"

command! MakeTags !ctags -R .
command! Bwclose bp | sp | bn | bd

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Syntax and colorscheme
syn on
colorscheme paps
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

iab bashs #!/bin/bash 

if filereadable(expand("~/.vim/keymaps"))
	source ${HOME}/.vim/keymaps
else
	source ${HOME}/dotfiles/.vim/keymaps
endif
