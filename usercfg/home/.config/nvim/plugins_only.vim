"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins only,
" thus making initial plugin installation graceful

call plug#begin(stdpath('data') . '/plugged')
source $HOME/.config/nvim/_plugins.vim
call plug#end()
