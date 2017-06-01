"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic.vim <https://github.com/amix/vimrc>
source $VILA/config/.config/nvim/_basic.vim

" Allow hidden buffer
set hidden

" Height of the command bar
set cmdheight=1

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 80 characters
set lbr
set tw=80

" Display line number in hybrid mode
set number
set relativenumber

" Highlight current line
set cursorline

" Configure default register with system clipboard
set clipboard=unnamed,unnamedplus

" Buffer settings
set switchbuf=useopen

" Turn off mouse mode
set mouse=

" Exclude quickfix buffers from buffer list
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END
