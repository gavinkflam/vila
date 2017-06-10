"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.local/share/nvim/plugged')
source $VILA/config/.config/nvim/_plugins.vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" core.vim
source $VILA/config/.config/nvim/_core.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
source $VILA/config/.config/nvim/_plugins_conf.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
source $VILA/config/.config/nvim/_commands.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
source $VILA/config/.config/nvim/_key_mappings.vim
