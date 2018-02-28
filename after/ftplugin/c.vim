"""""""""""""""""""""""""""""""""""""""
" Indentation

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal cindent

""""""""""""""""""""""""""""""""""""""
" Format Options
" c - autowrap comments using textwidth, inserting the current comment leader
" automatically
" r - insert the current comment leader after hitting enter in insert mode

set formatoptions=cqr


autocmd FileType cpp noremap <buffer> <F8> :call Uncrustify('cpp')<CR>
autocmd FileType cpp vnoremap <buffer> <F8> :call RangeUncrustify('cpp')<CR>
