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
xnoremap p "_dP

" Tab navigation
nnoremap <A-1> <Esc>1gt
nnoremap <A-2> <Esc>2gt
nnoremap <A-3> <Esc>3gt
nnoremap <A-4> <Esc>4gt
nnoremap <A-5> <Esc>5gt
nnoremap <A-6> <Esc>6gt
nnoremap <A-7> <Esc>7gt
nnoremap <A-8> <Esc>8gt
nnoremap <A-9> <Esc>9gt
nnoremap <A-0> <Esc>10gt

nnoremap H gT
nnoremap L gt
nnoremap J :tabclose<CR>
nnoremap K :tabnew<CR>

" Keys for custom commands
nnoremap <C-t> <Esc>:Fuzzy<CR>
nnoremap <C-g> <Esc>:Ag 

