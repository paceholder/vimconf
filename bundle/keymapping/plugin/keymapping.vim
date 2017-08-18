"imapclear
"nmapclear

" Move one line Up

nnoremap h k
vnoremap h k
onoremap h k

" Move one line Down

nnoremap k j
vnoremap k j
onoremap k j

" Move one character Left

nnoremap j h
vnoremap j h
onoremap j h

" Move one character Right
nnoremap l l
vnoremap l l
onoremap l l

" Move forward to the beginning of a word

nnoremap b w
vnoremap b w
onoremap b w

" Move backward to the beginning of a word

nnoremap B b
vnoremap B b
onoremap B b

" Move forward to the end of a word

nnoremap e e
vnoremap e e
onoremap e e

" Move backward to the end of a word

nnoremap E ge
vnoremap E ge
onoremap E ge

" Jump to the beginning of the line

nnoremap J 0
vnoremap J 0
onoremap J 0

" Jump to the end of the line

nnoremap L $
vnoremap L $
onoremap L $

" Scroll up half a screen.

nnoremap H <C-u>
vnoremap H <C-u>
onoremap H <C-u>

" Scroll down half a screen.

nnoremap K <C-d>
vnoremap K <C-d>
onoremap K <C-d>

" Join (Combine) the current line with the line below.

nnoremap c J
vnoremap c J

" Join (Combine) the current line with the line above.

nnoremap C <Up>J
vnoremap C J

" New line below

nnoremap o o<Esc>

" New line above

nnoremap O O<Esc>

" Switch between buffers

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Switch to the Insert Mode after the cursor.

nnoremap I a

" Switch to the Insert Mode at the beginning of the current line.

nnoremap a I

" Redo

nnoremap U <C-r>

" Break the current line and move to the next one.

nnoremap <CR>   i<CR><Esc><Right>
nnoremap <S-CR> a<CR><Esc><Right>

" Break the current line and stay on it.

inoremap <S-CR> <CR><Esc><Up>A
