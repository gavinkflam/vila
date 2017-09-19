"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code display

" Better Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'

" Always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

" Move items left and right
Plug 'andrewradev/sideways.vim'

" Provide CamelCase motion through words
Plug 'bkad/CamelCaseMotion'

" simple, easy-to-use alignment plugin
Plug 'junegunn/vim-easy-align'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Multiple empty lines and trailing white spaces cleaner for Vim
Plug 'KuoE0/vim-janitor'

" Interactive command execution in Vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Run async shell commands in Vim 8.0 / NeoVim and output to quickfix window
Plug 'skywind3000/asyncrun.vim'

" Simplified clipboard functionality for Vim
Plug 'svermeulen/vim-easyclip'

" True Sublime Text style multiple selections for Vim
Plug 'terryma/vim-multiple-cursors'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/tpope-vim-abolish'

" Commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'tpope/vim-speeddating'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion

" Provides support for expanding abbreviations similar to emmet
Plug 'mattn/emmet-vim'

" Dark powered asynchronous completion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Wisely add 'end'
Plug 'tpope/vim-endwise'

" Surround.vim: quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages

" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'

"----- Elixir -----

" phoenix.vim: rails.vim inspired tools for Phoenix
Plug 'c-brenn/phoenix.vim', { 'for': 'elixir' }

" Elixir Integration Into Vim
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations

" A Vim plugin which shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" A git commit browser
Plug 'junegunn/gv.vim'

" Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes
Plug 'maxbrunsfeld/vim-emacs-bindings'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" Seamless integration for vim and tmux's clipboard
Plug 'roxma/vim-tmux-clipboard'

" fugitive.vim: a Git wrapper
Plug 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface

" Forget Vim tabs – now you can have buffer tabs
Plug 'ap/vim-buftabline'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes

" Base16 for Vim
Plug 'chriskempson/base16-vim'
