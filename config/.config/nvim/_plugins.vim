"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core

" Forget Vim tabs – now you can have buffer tabs
Plug 'ap/vim-buftabline'

" Precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Dark powered asynchronous completion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" Tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Interactive command execution in Vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Run async shell commands in Vim 8.0 / NeoVim and output to quickfix window
Plug 'skywind3000/asyncrun.vim'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git

" A Vim plugin which shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" fugitive.vim: a Git wrapper
Plug 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GraphQL

Plug 'jparise/vim-graphql'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript

" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting and indenting for vim
Plug 'mxw/vim-jsx'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mustache

" Mustache and handlebars mode for vim
Plug 'mustache/vim-mustache-handlebars'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby

" VimRubySupport
Plug 'vim-ruby/vim-ruby'
