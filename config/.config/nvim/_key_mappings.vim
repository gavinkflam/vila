"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
nnoremap <leader>ag :Ag<space>

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
" fugitive

nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gp :Gpull --rebase<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter

nnoremap <silent> [g :Gprevhunk<CR>
nnoremap <silent> ]g :Gnexthunk<CR>

nnoremap <leader>sh :GitGutterStageHunk<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gv.vim

nnoremap <leader>gv :GV!<CR>
nnoremap <leader>gV :GV<CR>
xnoremap <leader>gv :GV<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickfix

" Close the quickfix window
nnoremap <silent> \q :cclose<CR>

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

" Fast splitting
nmap <leader>hs :split<cr>
nmap <leader>vs :vsplit<cr>

" Fast quiting
nmap <leader>q :q<cr>
