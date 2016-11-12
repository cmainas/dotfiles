if &cp | set nocp | endif
set fileencodings=ucs-bom,utf-8,default,latin1
se  helplang=en

source ~/.vim/keymaps
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
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

