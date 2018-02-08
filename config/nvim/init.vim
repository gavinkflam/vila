"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.local/share/nvim/plugged')
source $VILA/config/nvim/_plugins.vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippet plugins
source $VILA/config/nvim/plugins/vmux.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" core.vim
source $VILA/config/nvim/_core.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
source $VILA/config/nvim/_plugins_conf.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
source $VILA/config/nvim/_commands.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
source $VILA/config/nvim/_key_mappings.vim
