"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core

" Forget Vim tabs – now you can have buffer tabs
Plug 'ap/vim-buftabline'

" Precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Vim motion on speed!
Plug 'easymotion/vim-easymotion'

" Better Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'

" Dark powered asynchronous completion framework for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

" Add emacs/bash/cocoa key bindings to vim, in insert and command-line modes
Plug 'maxbrunsfeld/vim-emacs-bindings'

" Run your favorite search tool from Vim, with an enhanced results list
Plug 'mileszs/ack.vim'

" Asynchronous linting and make framework for Neovim/Vim
Plug 'neomake/neomake'

" Tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

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
" Ansible

" Syntax highlighting Ansible's common filetypes
Plug 'pearofducks/ansible-vim', {
  \ 'for': ['ansible', 'ansible_template', 'ansible_hosts']
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git

" A Vim plugin which shows a git diff in the 'gutter'
Plug 'airblade/vim-gitgutter'

" fugitive.vim: a Git wrapper
Plug 'tpope/vim-fugitive'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GraphQL

Plug 'jparise/vim-graphql', { 'for': 'graphql' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript

" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" React JSX syntax highlighting and indenting for vim
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mustache

" Mustache and handlebars mode for vim
Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.mustache' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pug

" Vim syntax highlighting for Pug (formerly Jade) templates
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby

" VimRubySupport
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scala

" Scala filetype detection and highlighting
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
