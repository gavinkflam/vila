"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic.vim <https://github.com/amix/vimrc>
runtime _basic.vim

" Height of the command bar
set cmdheight=1

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 80 characters
set lbr
set tw=80

" Display line number
set number

" Get back Vim-CtrlSpace
nnoremap <silent><C-space> :CtrlSpace<CR>

" Configure default register with system clipboard
set clipboard=unnamed,unnamedplus

