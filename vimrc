""""""""""""""""""""""""""""""""""""""""""
"  Runtime path for VIM plugins and scripts

set runtimepath=/usr/share/vim/vim80
set runtimepath+=~/vimconfig

""""""""""""""""""""""""""""""""""""""""""

set nocompatible

"""""""""""""""""""""""""""""""""""""""""
" File Format defines the line endings

set fileformats=unix,dos


""""""""""""""""""""""""""""""""""""""""""
" Run pathogen on runtime's subdirectories

execute pathogen#infect()

" Invoke ":helptags" on all "doc" subdirectories in the "runtimepath" variable.
call pathogen#helptags()

filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""

set cursorline

""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"


""""""""""""""""""""""""""""""""""""""""""
" use UTF-8

set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""
" Display non-printable characters

set list
set listchars=trail:·,precedes:«,extends:»,tab:▸- 
" eol:↲

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" NERD Tree

nnoremap <Leader>t :NERDTreeToggle<CR>

let g:NERDTreeMapHelp = '<F1>'
let g:NERDTreeMapChangeRoot = 'r'

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" NERD Commenter

noremap CC :call NERDComment(0, "toggle")<CR>

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
 "delimitMate

 "let g:delimitMate_excluded_regions = ''

 "let g:delimitMate_matchpairs = '(:),[:],{:}'

let g:delimitMate_balance_matchpairs = 1

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1
