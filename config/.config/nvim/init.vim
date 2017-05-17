"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.local/share/nvim/plugged')
source $VILA/config/.config/nvim/_plugins.vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" basic.vim mod
source $VILA/config/.config/nvim/_basic_mod.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
source $VILA/config/.config/nvim/_plugins_conf.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
source $VILA/config/.config/nvim/_commands.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
source $VILA/config/.config/nvim/_key_mappings.vim

