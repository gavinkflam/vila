"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --hidden'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun.vim

" Asyncrun fugitive commands
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Display asyncrun status in airline status bar
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim

" Show hidden files
let g:ctrlp_show_hidden = 1

" Custom mappings
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<M-r>'],
  \ }

if executable('ag')
  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 8 --hidden -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete.vim

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion/vim-easymotion

" Move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>d <Plug>(easymotion-bd-w)
nmap <Leader>d <Plug>(easymotion-overwin-w)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Valloric/MatchTagAlways

" Recognize mustache files
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'html.mustache' : 1,
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-graphql.vim

" Recognize graphql schema files
augroup filetype_graphqls
  autocmd!
  autocmd BufNewFile,BufRead *.graphqls set filetype=graphql
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline

" Display statusline all the time
set laststatus=2

" Use solarized theme
let g:airline_theme='solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-emacs-bindings

" Meta keys for insert mode
inoremap <Esc>b <M-b>
inoremap <Esc>f <M-f>
inoremap <Esc>d <M-d>
inoremap <Esc>h <M-h>

imap <M-b> <C-o>b
imap <M-f> <C-o>e<Right>
imap <M-d> <C-o>de
imap <M-h> <C-w>

" Meta keys for command mode
cnoremap <Esc>b <M-b>
cnoremap <Esc>f <M-f>
cnoremap <Esc>d <M-d>
cnoremap <Esc>h <M-h>

cmap <M-b> <S-Left>
cmap <M-f> <S-Right>
cnoremap <M-d> <S-Right><C-w>
cnoremap <M-h> <C-w>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-scala

" Sort imports across groups
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(com.rovle.\|hk.gavin.\)'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pug

" Recognize jade filetype
augroup filetype_jade
  autocmd!
  autocmd BufNewFile,BufRead *.jade set filetype=pug
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake

" Run Neomake on save
augroup neomake_auto_make
  autocmd! BufRead,BufWritePost * Neomake
augroup END

" Enable credo as a neomake maker for elixir
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized

set background=dark
colorscheme solarized
