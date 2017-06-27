"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core

" Forget Vim tabs – now you can have buffer tabs
Plug 'ap/vim-buftabline'

" Precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Better Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'

" Dark powered asynchronous completion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes
Plug 'maxbrunsfeld/vim-emacs-bindings'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" Extended f, F, t and T key mappings for Vim
Plug 'rhysd/clever-f.vim'

" Tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

" Interactive command execution in Vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Run async shell commands in Vim 8.0 / NeoVim and output to quickfix window
Plug 'skywind3000/asyncrun.vim'

" Commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" Abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/tpope-vim-abolish'

" Surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elixir

" phoenix.vim: rails.vim inspired tools for Phoenix
Plug 'c-brenn/phoenix.vim', { 'for': 'elixir' }

" Elixir Integration Into Vim
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git

" A Vim plugin which shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" fugitive.vim: a Git wrapper
Plug 'tpope/vim-fugitive'
