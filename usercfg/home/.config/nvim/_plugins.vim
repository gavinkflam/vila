"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code display

" Selectively illuminating other uses of current word under the cursor
Plug 'RRethy/vim-illuminate'

" Always highlights the enclosing html/xml tags
Plug 'Valloric/MatchTagAlways'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands

" Provide CamelCase motion through words
Plug 'bkad/CamelCaseMotion'

" simple, easy-to-use alignment plugin
Plug 'junegunn/vim-easy-align'

" The missing motion for Vim
Plug 'justinmk/vim-sneak'

" Multiple empty lines and trailing white spaces cleaner for Vim
Plug 'KuoE0/vim-janitor'

" Defines a new text object representing lines of code at the same indent level
Plug 'michaeljsmith/vim-indent-object'

" Interactive command execution in Vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Run async shell commands in Vim 8.0 / NeoVim and output to quickfix window
Plug 'skywind3000/asyncrun.vim'

" Simplified clipboard functionality for Vim
Plug 'svermeulen/vim-easyclip'

" Vim motions to the start and end of the current indentation-delimited block.
Plug 'tmhedberg/indent-motion'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Software capslock
Plug 'tpope/vim-capslock'

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

"----- BuckleScript -----

" Language server for reason
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Reason Vim editor integration
Plug 'reasonml-editor/vim-reason-plus'

"----- Lisp -----

" Precision Editing for S-expressions
Plug 'guns/vim-sexp', { 'for': 'clojure' }

" vim-sexp mappings for regular people
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

"----- Clojure -----

" A bag of goodies for working with a Clojure REPL
Plug 'SevereOverfl0w/vim-replant', { 'do': ':UpdateRemotePlugins' }

" Clojure REPL support
Plug 'tpope/vim-fireplace', { 'for' : 'clojure' }

"----- Elixir -----

" phoenix.vim: rails.vim inspired tools for Phoenix
Plug 'c-brenn/phoenix.vim', { 'for': 'elixir' }

" Elixir Integration Into Vim
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

"----- Golang -----

Plug 'fatih/vim-go', { 'for': 'go' }

"----- Javascript -----

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Integrations

" A Vim plugin which shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'

" Frictionless REPL with vim and tmux
if isdirectory(expand('$HOME/dev/vmux'))
  Plug '$HOME/dev/vmux'
else
  Plug 'gavinkflam/vmux'
endif

" A git commit browser
Plug 'junegunn/gv.vim'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" Seamless integration for vim and tmux's clipboard
Plug 'roxma/vim-tmux-clipboard'

" fugitive.vim: a Git wrapper
Plug 'tpope/vim-fugitive'

" Readline style insertion
Plug 'tpope/vim-rsi'

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

" Heuristically set buffer options
if isdirectory(expand('$HOME/dev/vim-sleuth'))
  Plug '$HOME/dev/vim-sleuth'
else
  Plug 'gavinkflam/vim-sleuth'
endif

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Meta-vim

" A simple Vimscript test framework
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes

" Base16 for Vim
Plug 'chriskempson/base16-vim'
