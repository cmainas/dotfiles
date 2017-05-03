"version 6.0
if &cp | set nocp | endif
set fileencodings=ucs-bom,utf-8,default,latin1
se  helplang=en
"set noloadplugins
" vim: set ft=vim :

"for assembly 
let asmsyntax = "asm68k"

source ~/.vim/keymaps
set incsearch
set nocompatible 
set number
set relativenumber
set path+=**
set wildmenu
command! MakeTags !ctags -R .
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
command! Bwclose bp | sp | bn | bd
"set completeopt
filetype plugin indent on
syn on
colorscheme paps
"inoremap { <Down>{<Down>}<Left>
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap " ""<Left>
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"set completeopt=longest
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without changing the text
"inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
"inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
"            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'

iab bashs #!/bin/bash 
