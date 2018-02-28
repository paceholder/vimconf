""""""""""""""""""""""""""""""""""""""""""
"  Runtime path for VIM plugins and scripts

set runtimepath=/usr/share/vim/vim74
set runtimepath+=~/vimconf
set runtimepath+=~/vimconf/after

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
" For some simple "fuzzy" search

set path+=**

set wildmenu

""""""""""""""""""""""""""""""""""""""""""
" CTAGS

command! MakeTags !ctags -R .


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
"  Convert tabs to spaces

set expandtab
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""
" Display line numbers

set number


"""""""""""""""""""""""""""""""""""""""""
" Swap and backup

set writebackup

set backup

set backupcopy=yes

set backupskip=

set backupdir=~/.backup

autocmd BufWritePre * let &backupext = '~@'
    \ . substitute(expand('%:p:h'), '[\\/:]', '%', 'g')

set swapfile

set updatetime=2000

set directory=~/.swap//


"""""""""""""""""""""""""""""""""""""""""
" Search / Regular Expressions

" Wrap around the end of the file when searching.
set wrapscan

" Highlight search matches.
set hlsearch

" Search as you type.
set incsearch

" Ignore case in the search pattern.
set ignorecase

" Override the "ignorecase" option if the search pattern contains uppercase
" letters.
set smartcase

" In regular expressions, treat most characters literally, while require
" certain ones to be preceded with backward slash "\" in order to gain special
" meaning.
set magic

"""""""""""""""""""""""""""""""""""""""""
"      GUI MODE for gvim

if has("gui_running")
  set background=dark
  colorscheme solarized
  set guifont=Droid\ Sans\ Mono\ 14
  set guifont=Ubuntu\ Mono\ 14

  " remove menu and toolbar
  set guioptions -=m
  set guioptions -=T

  map <Leader>bg :let &background = (&background == "dark" ? "light" : "dark")<CR>

endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

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
" delimitMate

 "let g:delimitMate_excluded_regions = ''

 "let g:delimitMate_matchpairs = '(:),[:],{:}'

let g:delimitMate_balance_matchpairs = 1

let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" vim-airline

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" "fswitch"

autocmd BufEnter *.hpp let b:fswitchdst = 'cpp,c++,cxx,cc,c'
autocmd BufEnter *.cpp let b:fswitchdst = 'hpp,h++,hxx,hh,h'

autocmd BufEnter *.hpp,*.h++,*.hxx,*.hh,*.h let b:fswitchlocs = 'reg:/include/src/'
autocmd BufEnter *.cpp,*.c++,*.cxx,*.cc,*.c let b:fswitchlocs = 'reg:/src/include/'


nnoremap <silent> <Leader>s :up<CR>:FSHere<CR>


"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion = 1


