"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
nnoremap <leader>g :Ag<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer

nnoremap <silent> \b :Bclose<CR>
nnoremap <silent> \B :Bonly<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing

" Remap VIM 0 to first non-blank character
map 0 ^

" Map Ctrl-J to enter key for better plugin support
imap <C-J> <CR>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Fast saving
nmap <leader>w :w!<cr>

" Disable Ex mode
nnoremap Q <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter

nnoremap <silent> [g :Gprevhunk<CR>
nnoremap <silent> ]g :Gnexthunk<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste
"
" Do not overwrite default register when pasting
xnoremap p pgvy

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix

" Close the quickfix window
nnoremap <silent> \q :cclose<CR>

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
" Search and replace

" Turn off search highlight
nnoremap <silent> \h :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab

nnoremap <silent> \t :tabclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode

" Pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast quiting
nmap <leader>q :q<cr>
