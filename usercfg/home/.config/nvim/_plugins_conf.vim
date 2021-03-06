"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations for plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mileszs/ack.vim

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden --ignore .git/'
endif

" Ag commands with autocomplete
command! -nargs=* -complete=file Ag Ack -Q -- <q-args>
command! -nargs=* -complete=file Agp Ack <args>

command! -nargs=* -complete=file AgAdd AckAdd -Q -- <q-args>
command! -nargs=* -complete=file AgpAdd AckAdd <args>

command! -nargs=* -complete=file LAg LAck -Q -- <q-args>
command! -nargs=* -complete=file LAgp LAck <args>

command! -nargs=* -complete=file LAgAdd LAckAdd -Q -- <q-args>
command! -nargs=* -complete=file LAgpAdd LAckAdd <args>

nnoremap <leader>ag :Ag<space>

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
" autozimu/LanguageClient-neovim

let g:LanguageClient_serverCommands = {
  \ 'reason': [expand('$HOME/.lsp/reason-language-server')]
  \ }

nnoremap <silent> K    :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/gv.vim

nnoremap <leader>gv :GV!<CR>
nnoremap <leader>gV :GV<CR>
xnoremap <leader>gv :GV<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" skywind3000/asyncrun.vim

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
" ctrlpvim/ctrlp.vim

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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --depth 8 --hidden --ignore .git/ -g ""'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shougo/deoplete.nvim

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dyng/ctrlsf.vim

nnoremap <leader>f :CtrlSF<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gavinkflam/vmux

" Dispatch selection to companion pane (e.g. vipg,)
xmap g,    <Plug>(Vmux_dispatch)

" Start Vmux for a motion / text object (e.g. g,ip)
nmap g,    <Plug>(Vmux_dispatch_op)

" Dispatch current line to companion pane
imap <M-,> <Plug>(Vmux_dispatch)
nmap g,,   <Plug>(Vmux_dispatch)

" Dispatch arbitary text
nnoremap <leader>, :VmuxDispatch<space>

" Clear companion pane
nnoremap <leader>cl :VmuxClearPane<CR>

" Haskell GHCi commands mappings
augroup vmuxHaskellMappings
  au!

  " GHCi command
  au FileType haskell nnoremap <leader>hg :VmuxGhci<space>

  " Add, load and reload
  au FileType haskell nnoremap <leader>af :VmuxGhciAddFile<CR>
  au FileType haskell nnoremap <leader>lf :VmuxGhciLoadFile<CR>
  au FileType haskell nnoremap <leader>r :VmuxGhciReload<CR>
  au FileType haskell nnoremap <leader>wr :w \| :VmuxGhciReload<CR>

  " Browse and info
  au FileType haskell nnoremap <leader>hb :VmuxGhciBrowseWord<CR>
  au FileType haskell nnoremap <leader>hi :VmuxGhciInfoWord<CR>

  " Type commands
  au FileType haskell nnoremap <leader>t :VmuxGhciTypeWord<CR>
  au FileType haskell nnoremap <leader>T :VmuxGhciTypeIt<CR>

  " Stack commands
  au FileType haskell nnoremap <leader>sb :VmuxGhciStackBuild<CR>
  au FileType haskell nnoremap <leader>st :VmuxGhciStackTest<CR>
augroup END

" jacquesbh/vim-showmarks

" Display marks for all buffer by default
augroup showmarks
  au!
  au VimEnter * DoShowMarks!
augroup END

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

" Change color of sneak labels to grayscale
autocmd ColorScheme * hi Sneak guifg=white guibg=darkgray ctermfg=white ctermbg=darkgray
autocmd ColorScheme * hi SneakScope guifg=white guibg=darkgray ctermfg=white ctermbg=darkgray

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mattn/emmet-vim

" Use space for indentation
let g:user_emmet_settings = {
  \ 'indentation' : ' '
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pangloss/vim-javascript

" Enable syntax highlighting for Flow
let g:javascript_plugin_flow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RRethy/vim-illuminate

" Delay 500 ms before illuminating
let g:Illuminate_delay = 500

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

command! -nargs=* Gaddall silent execute "!git add --all" <q-args>
command!          Gstash  execute "!git add --all && git commit -m 'Stash'"

nnoremap <leader>gA :Gaddall<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gaddall<CR>:Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog --oneline --graph --decorate<CR>
nnoremap <leader>gL :Glog --oneline --graph --decorate --<CR>
nnoremap <leader>gP :Gpush origin HEAD<CR>
nnoremap <leader>gp :Gpull --rebase<CR>
nnoremap <leader>gr :Git reset<CR>
nnoremap <leader>gs :Gstatus<CR>
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
" vim-airline/vim-airline

" Display statusline all the time
set laststatus=2

" Use solarized theme
let g:airline_theme='base16'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neomake/neomake

" Run Neomake on save
augroup neomake_auto_make
  autocmd! BufRead,BufWritePost * Neomake
augroup END

" Configure linters for elixir
let g:neomake_elixir_enabled_makers = ['mix', 'credo', 'dogma']

" Configure linters for haskell
let g:neomake_haskell_enabled_makers = ['hlint', 'cabal']

" Configure linters for javascript
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plasticboy/vim-markdown

" Disable markdown conceal
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" prettier/vim-prettier

augroup vim_prettier_key_mappings
  au!
  au FileType javascript nmap <leader>op <Plug>(Prettier)
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/nerdtree

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Use <leader>n variants for NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>
