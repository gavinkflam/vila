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
nnoremap Q :bdelete<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys for custom commands
nnoremap <C-g> <Esc>:Ag 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Escape

" Use Ctrl-Space to exit from various mode
cnoremap <C-Space> <Esc>
inoremap <C-Space> <Esc>
nnoremap <C-Space> <Esc>
onoremap <C-Space> <Esc>
vnoremap <C-Space> <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse

" Disable scrolling with a mouse whell
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>
