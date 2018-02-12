"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ack.vim

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column --hidden'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ap/vim-buftabline

" Display ordinal numbering on buftabline
let g:buftabline_numbers = 2

" Key mapping to switch buffers by their ordinal number
nmap <M-1> <Plug>BufTabLine.Go(1)
nmap <M-2> <Plug>BufTabLine.Go(2)
nmap <M-3> <Plug>BufTabLine.Go(3)
nmap <M-4> <Plug>BufTabLine.Go(4)
nmap <M-5> <Plug>BufTabLine.Go(5)
nmap <M-6> <Plug>BufTabLine.Go(6)
nmap <M-7> <Plug>BufTabLine.Go(7)
nmap <M-8> <Plug>BufTabLine.Go(8)
nmap <M-9> <Plug>BufTabLine.Go(9)
nmap <M-0> <Plug>BufTabLine.Go(10)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun.vim

" Asyncrun fugitive commands
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Display asyncrun status in airline status bar
let g:airline_section_error =
  \ airline#section#create_right(['%{g:asyncrun_status}'])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bkad/CamelCaseMotion

" Apply default mappings for CamelCaseMotion with comma prefix
call camelcasemotion#CreateMotionMappings(',')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" chriskempson/base16-vim

let base16colorspace=256
colorscheme base16-grayscale-dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp.vim

" Change key mapping for invoking CtrlP
let g:ctrlp_map = '<leader>p'

nnoremap <leader>b :CtrlPBuffer<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dyng/ctrlsf.vim

nnoremap <leader>f :CtrlSF<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gavinkflam/vmux

imap <M-,> <Plug>(Vmux_dispatch)
nmap ,, <Plug>(Vmux_dispatch)
xmap ,, <Plug>(Vmux_dispatch)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" justinmk/vim-sneak

" Turn on label mode
let g:sneak#label = 1

" Normal mode mappings to allow invoking in plugin contexts
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S

" Replace f and t with one-character sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mattn/emmet-vim

" Use space for indentation
let g:user_emmet_settings = {
  \ 'indentation' : ' '
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" svermeulen/vim-easyclip

" Use gs for substitute
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

" Use x for move
let g:EasyClipUseCutDefaults = 0

nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

" Use Alt-p and Alt-n for swaping pastes
let g:EasyClipUsePasteToggleDefaults = 0

nmap <M-p> <plug>EasyClipSwapPasteForward
nmap <M-n> <plug>EasyClipSwapPasteBackwards

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/fugitive

function! Gstash()
  execute "!git add --all && git commit -m 'Stash'"
endfunction

command! -nargs=* Gaddall silent execute "!git add --all" <q-args>
command! -nargs=* Ggraph  execute "Git log --graph" <q-args>
command! -nargs=* Greset  execute "!git reset" <q-args>
command!          Gstash  call Gstash()

nnoremap <leader>gA :Gaddall<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gaddall<CR>:Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gg :Ggraph --oneline --decorate<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gP :Gpush origin HEAD<CR>
nnoremap <leader>gp :Gpull --rebase<CR>
nnoremap <leader>gr :Greset --mixed<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>g- :Greset --mixed HEAD~1<CR>
nnoremap <leader>g+ :Gstash<CR>

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
let g:airline_theme='base16'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake

" Run Neomake on save
augroup neomake_auto_make
  autocmd! BufRead,BufWritePost * Neomake
augroup END

" Configure linters for elixir
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Use <leader>n variants for NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>