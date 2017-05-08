"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Replace and delete
"
" These are to cancel the default behavior of c, C, x, X
" to put the text they delete in the default register.
" Note that this means e.g. "ad won't copy the text into
" register a anymore.  You have to explicitly yank it.
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste
"
" Do not overwrite default register when pasting
xnoremap p pgvy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer

" Buffer navigation
nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>
nnoremap T :enew<CR>

" Close the current buffer and move to the previous one
nnoremap Q :bp <BAR> bd #<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys for custom commands
nnoremap <C-g> <Esc>:Ag 

