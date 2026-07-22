""""""""""""""""""""""""""""""""""""""
" fswitch: dynamic source<->header switching
"
" Layout variants handled:
"   module/src/Foo.cpp  <->  module/inc/Foo.h
"   module/src/Foo.cpp  <->  module/include/Foo.h
"   module/src/Foo.cpp  <->  module/include/<module>/Foo.h
"   module/Foo.cpp      <->  module/include/Foo.h  (no src subdir)

function! s:SetFswitchLocs() abort
    let dir = expand('%:p:h')
    let tail = fnamemodify(dir, ':t')
    let ext = expand('%:e')

    if ext =~# '^\(hpp\|hxx\|hh\|h++\|h\)$'
        " Header file: find the source
        let b:fswitchdst = 'cpp,c++,cxx,cc,c'
        if tail ==# 'inc'
            let b:fswitchlocs = 'reg:/inc$/src/,.'
        elseif tail ==# 'include'
            let b:fswitchlocs = 'reg:/include$/src/,rel:..,.'
        elseif fnamemodify(dir, ':h:t') ==# 'include'
            " include/<mod>/ layout
            let b:fswitchlocs = 'reg:/include/' . tail . '$/src/,.'
        else
            let b:fswitchlocs = '.'
        endif
    else
        " Source file: find the header
        let b:fswitchdst = 'hpp,h++,hxx,hh,h'
        if tail ==# 'src'
            let mod = fnamemodify(dir, ':h:t')
            let b:fswitchlocs = 'reg:/src$/inc/,reg:/src$/include/,reg:/src$/include/' . mod . '/,.'
        else
            let b:fswitchlocs = 'rel:include,.'
        endif
    endif
endfunction

augroup fswitch_cpp
    autocmd! BufEnter <buffer> call s:SetFswitchLocs()
augroup END
call s:SetFswitchLocs()

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

setlocal formatoptions=cqr

setlocal tw=81
setlocal colorcolumn=+1

noremap <buffer> <F8> :call Uncrustify('cpp')<CR>
vnoremap <buffer> <F8> :call RangeUncrustify('cpp')<CR>





function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction

noremap <buffer> <F9> :call FormatBuffer()<CR>
"autocmd FileType cpp vnoremap <buffer> <F9> :call FormatBuffer()<CR>
