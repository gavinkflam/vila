"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

call plug#begin(stdpath('data') . '/plugged')
source $HOME/.config/nvim/_plugins.vim
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core editor configurations
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Per deployment configurations
if filereadable(expand('$HOME/.vimrc'))
  source $HOME/.vimrc
endif
