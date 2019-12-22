"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins only,
" thus making initial plugin installation graceful

call plug#begin('~/.local/share/nvim/plugged')
source $HOME/.config/nvim/_plugins.vim
call plug#end()
