"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core configurations
"
" Modified from basic.vim 6.0
"   https://github.com/amix/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer

" Allow hidden buffer
set hidden

" When using quickfix, jump to the first open window that
" contains the specified buffer
set switchbuf=useopen

" Always show tabline
set stal=2

" Exclude quickfix buffers from buffer list
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard

" Configure default register with system clipboard
set clipboard=unnamed,unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim user interface

" Sets how many lines of history VIM has to remember
set history=500

" Display line number in hybrid mode
set number
set relativenumber

" Show a different background colour past 80 characters
let &colorcolumn=join(range(81,200),",")

" Highlight current line
set cursorline

" Height of the command bar
set cmdheight=1

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

"Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Turn off mouse mode
set mouse=

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn backup off, since most stuff is version controlled
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader

" Map <space> as leader
nnoremap <Space> <nop>
vnoremap <Space> <nop>

let mapleader = " "
let g:mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and replace

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Turn on inccommand
if exists('&inccommand')
  set inccommand=nosplit
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab, indent and linebreak

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Linebreak on 80 characters
set lbr
set tw=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typing

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
