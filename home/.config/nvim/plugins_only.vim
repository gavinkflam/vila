"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins only,
" thus making initial plugin installation graceful

call plug#begin('~/.local/share/nvim/plugged')
runtime _plugins.vim
call plug#end()

