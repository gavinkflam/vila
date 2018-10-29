"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin('~/.local/share/nvim/plugged')
source $HOME/.config/nvim/_plugins.vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" core.vim
source $HOME/.config/nvim/_core.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations
source $HOME/.config/nvim/_plugins_conf.vim
source $HOME/.config/nvim/_color_scheme.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
source $HOME/.config/nvim/_commands.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
source $HOME/.config/nvim/_key_mappings.vim
