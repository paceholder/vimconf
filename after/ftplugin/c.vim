""""""""""""""""""""""""""""""""""""""
" fswitch: dynamic header<->source switching
"
" Layout variants handled:
"   module/inc/Foo.h          <->  module/src/Foo.cpp
"   module/include/Foo.h      <->  module/src/Foo.cpp
"   module/include/<mod>/Foo.h <-> module/src/Foo.cpp
"   module/include/Foo.h      <->  module/Foo.cpp  (no src subdir)

function! s:SetFswitchLocsHeader() abort
    let dir = expand('%:p:h')
    let tail = fnamemodify(dir, ':t')
    let parent = fnamemodify(dir, ':h:t')
    let b:fswitchdst = 'cpp,c++,cxx,cc,c'
    if tail ==# 'inc'
        " module/inc/ -> module/src/
        let b:fswitchlocs = 'reg:/inc$/src/,.'
    elseif tail ==# 'include'
        " module/include/ -> module/src/ or module/ (no src)
        let b:fswitchlocs = 'reg:/include$/src/,rel:..,.'
    elseif parent ==# 'include'
        " module/include/<mod>/ -> module/src/
        let b:fswitchlocs = 'reg:/include/' . tail . '$/src/,.'
    else
        let b:fswitchlocs = '.'
    endif
endfunction

augroup fswitch_c
    autocmd! BufEnter <buffer> call s:SetFswitchLocsHeader()
augroup END
call s:SetFswitchLocsHeader()

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
